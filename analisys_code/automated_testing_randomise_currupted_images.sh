#!/bin/bash

# This code tests the randomize in blocks of 10 subjects to see if it properly works or the first level images are corrupted

# Lê os sujeitos do arquivo newallsubs.txt
sub_files=($(cat allsubs.txt))

# Define o número de sujeitos por lote
lote=10

# Itera sobre os sujeitos em lotes
for ((i=0; i<=${#sub_files[@]}-$lote; i++)); do
    # Cria ou limpa o arquivo de saída para cada iteração
    output_file="output_lote_$((i+1))_to_$((i+lote)).txt"
    echo "Processando sujeitos de $((i+1)) a $((i+lote))" > "$output_file"
    
    file_paths=""
    
    # Itera sobre os sujeitos no lote atual
    for ((j=0; j<lote; j++)); do
        subject=${sub_files[i+j]}
        echo "Processando sujeito: $subject" >> "$output_file"
        
        # Encontrar todos os arquivos que correspondam ao padrão usando um loop
        for filepath in $(find ".//firstlevel_results//${subject}//ses-1//func" -name "${subject}_ses-1_task-rest_run-?_space-MNI152NLin2009cAsym_seed-DCPutamen_tstat.nii.gz");do
            if [ -f "$filepath" ]; then
                file_paths+="$filepath "
            else
                echo "Arquivo não encontrado: $filepath" >> "$output_file"
            fi
        done
    done
    
    # Verifica se há arquivos válidos para processar
    if [ -n "$file_paths" ]; then
        # Junta os arquivos do lote e roda o comando randomise
        concatenated_data="prob_lote_$((i+1))_to_$((i+lote)).nii.gz"
        fslmerge -t "$concatenated_data" ${file_paths[@]} >> "$output_file" 2>&1
        
        # Executa o randomise e salva a saída no arquivo de output
        randomise -i "$concatenated_data" -d problem_subs_second_level_analisys.mat -t problem_subs_second_level_analisys.con -o prob_lote_$((i+1))_to_$((i+lote))_results -n 1000 -T -x -c 3.1 >> "$output_file" 2>&1
        
        # Move os resultados e o arquivo concatenado para um diretório de saída específico
        rm "$concatenated_data" 
        rm ./prob_lote_*_to_*_results_clustere_corrp_tstat1.nii.gz
        rm ./prob_lote_*_to_*_results_tfce_corrp_tstat1.nii.gz
        rm ./prob_lote_*_to_*_results_tstat1.nii.gz
        rm ./prob_lote_*_to_*_results_vox_corrp_tstat1.nii.gz
        mv "$output_file" ./second_level_analysis
    else
        echo "Nenhum arquivo válido encontrado para o lote $((i+1)) a $((i+lote))." >> "$output_file"
    fi
done

# Testando para todos os arquivos se deram erro

# Loop para cada arquivo no diretório
for filepath in ./second_level_analysis/output_lote_*_to_*.txt; do
    # Verifica se a string "Error, exiting" está no arquivo
    if grep -q "ERROR: Program failed, unknown exception" "$filepath"; then
        echo "A string foi encontrada no arquivo: $(basename "$filepath")" >> "error_subs_atention.txt"
    fi
done
