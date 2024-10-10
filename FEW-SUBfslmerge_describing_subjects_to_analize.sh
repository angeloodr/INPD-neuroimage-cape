#!/bin/bash

sub_files=( 
'sub-02254'
'sub-02260'
'sub-02263'
'sub-02271'
'sub-02278'
'sub-02285'
'sub-02298'
'sub-02300'
'sub-02304'
'sub-02375'
)

##### dorso-caudal putamen
# Criar ou limpar o arquivo de saída
file_paths=""
concatenated_data="prob61subs_seed_DCPut_all4d.nii.gz"
#output_names="lista_teste_DCPut.txt"
#echo '' > "$output_names" 
# Iterar sobre os arquivos e adicionar ao arquivo de saída
for subject in "${sub_files[@]}"; do
    echo $subject
    filepath="./firstlevel_results/$subject/ses-1/func/${subject}_ses-1_task-rest_run-?_space-MNI152NLin2009cAsym_seed-DCPutamen_tstat.nii.gz"
    #echo "$filepath" >> "${output_names} "
    file_paths+="${filepath} " 
    #echo $file_path
done

fslmerge -t "$concatenated_data" ${file_paths[@]}

##### dorso-rostral putamen
# Criar ou limpar o arquivo de saída
file_paths=""
concatenated_data="prob61subs_seed_DRPut_all4d.nii.gz"
# output_names="lista_teste_DRPut.txt"
# echo '' > "$output_names" 
# Iterar sobre os arquivos e adicionar ao arquivo de saída
for subject in "${sub_files[@]}"; do
    echo $subject
    filepath="./firstlevel_results/$subject/ses-1/func/${subject}_ses-1_task-rest_run-?_space-MNI152NLin2009cAsym_seed-DRPutamen_tstat.nii.gz"
    # echo "$filepath" >> "${output_names} "
    file_paths+="${filepath} " 
    #echo $file_path
done
fslmerge -t "$concatenated_data" ${file_paths[@]}

##### ventro-rostral putamen
# Criar ou limpar o arquivo de saída
file_paths=""
concatenated_data="prob61subs_seed_VRPut_all4d.nii.gz"
# output_names="lista_teste_VRPut.txt"
# echo '' > "$output_names" 
# Iterar sobre os arquivos e adicionar ao arquivo de saída
for subject in "${sub_files[@]}"; do
    echo $subject
    filepath="./firstlevel_results/$subject/ses-1/func/${subject}_ses-1_task-rest_run-?_space-MNI152NLin2009cAsym_seed-VRPutamen_tstat.nii.gz"
    # echo "$filepath" >> "${output_names} "
    file_paths+="${filepath} " 
    #echo $file_path
done
fslmerge -t "$concatenated_data" ${file_paths[@]}

##### dorso caudado
# Criar ou limpar o arquivo de saída
file_paths=""
concatenated_data="prob61subs_seed_DorsalCaudate_all4d.nii.gz"
# output_names="lista_teste_DorsalCaudate.txt"
# echo '' > "$output_names" 
# Iterar sobre os arquivos e adicionar ao arquivo de saída
for subject in "${sub_files[@]}"; do
    echo $subject
    filepath="./firstlevel_results/$subject/ses-1/func/${subject}_ses-1_task-rest_run-?_space-MNI152NLin2009cAsym_seed-DorsalCaudate_tstat.nii.gz"
    # echo "$filepath" >> "${output_names} "
    file_paths+="${filepath} " 
    #echo $file_path
done
fslmerge -t "$concatenated_data" ${file_paths[@]}

##### InfVentralCaudate
# Criar ou limpar o arquivo de saída
file_paths=""
concatenated_data="prob61subs_seed_InfVentralCaudate_all4d.nii.gz"
# output_names="lista_teste_InfVentralCaudate.txt"
# echo '' > "$output_names" 
# Iterar sobre os arquivos e adicionar ao arquivo de saída
for subject in "${sub_files[@]}"; do
    echo $subject
    filepath="./firstlevel_results/$subject/ses-1/func/${subject}_ses-1_task-rest_run-?_space-MNI152NLin2009cAsym_seed-InfVentralCaudate_tstat.nii.gz"
    # echo "$filepath" >> "${output_names} "
    file_paths+="${filepath} " 
    #echo $file_path
done
fslmerge -t "$concatenated_data" ${file_paths[@]}

##### SupVentralCaudate
# Criar ou limpar o arquivo de saída
file_paths=""
concatenated_data="prob61subs_seed_SupVentralCaudate_all4d.nii.gz"
# output_names="lista_teste_SupVentralCaudate.txt"
# echo '' > "$output_names" 
# Iterar sobre os arquivos e adicionar ao arquivo de saída
for subject in "${sub_files[@]}"; do
    echo $subject
    filepath="./firstlevel_results/$subject/ses-1/func/${subject}_ses-1_task-rest_run-?_space-MNI152NLin2009cAsym_seed-SupVentralCaudate_tstat.nii.gz"
    # echo "$filepath" >> "${output_names} "
    file_paths+="${filepath} " 
    #echo $file_path
done
fslmerge -t "$concatenated_data" ${file_paths[@]}

mv ./prob61subs_seed_DCPut_all4d.nii.gz ./second_level_analysis
mv ./prob61subs_seed_DRPut_all4d.nii.gz ./second_level_analysis
mv ./prob61subs_seed_VRPut_all4d.nii.gz ./second_level_analysis
mv ./prob61subs_seed_DorsalCaudate_all4d.nii.gz ./second_level_analysis
mv ./prob61subs_seed_InfVentralCaudate_all4d.nii.gz ./second_level_analysis
mv ./prob61subs_seed_SupVentralCaudate_all4d.nii.gz ./second_level_analysis

cd second_level_analysis
randomise -i prob61subs_seed_DCPut_all4d.nii.gz -d prob61subs_second_level_analisys.mat -t prob61subs_second_level_analisys.con -o prob61subs_DCPut_capetot_results -n 1000 -T -x -c 3.1                             
cd ..     