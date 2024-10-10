#!/bin/bash

sub_files=(
    'sub-00003'
    'sub-00015'
    'sub-00019'
    'sub-00022'
    'sub-00028'
    'sub-00033'
    'sub-00034'
    'sub-00050'
    'sub-00062'
    'sub-00064'
    'sub-00066'
    'sub-00067'
    'sub-00076'
    'sub-00085'
    'sub-00089'
    'sub-00091'
    'sub-00102'
    'sub-00108'
    'sub-00122'
    'sub-00135'
    'sub-00138'
    'sub-00140'
    'sub-00147'
    'sub-00151'
    'sub-00165'
    'sub-00166'
    'sub-00179'
    'sub-00181'
    'sub-00215'
    'sub-00230'
    'sub-00236'
    'sub-00239'
    'sub-00252'
    'sub-00257'
    'sub-00258'
    'sub-00260'
    'sub-00262'
    'sub-00263'
    'sub-00269'
    'sub-00270'
    'sub-00304'
    'sub-00324'
    'sub-00328'
    'sub-00331'
    'sub-00335'
    'sub-00346'
    'sub-00351'
    'sub-00354'
    'sub-00357'
    'sub-00360'
    'sub-00371'
    'sub-00383'
    'sub-00397'
    'sub-00400'
    'sub-00409'
    'sub-00421'
    'sub-00423'
    'sub-00428'
    'sub-00434'
    'sub-00438'
    'sub-00440'
    'sub-00445'
    'sub-00446'
    'sub-00454'
    'sub-00456'
    'sub-00462'
    'sub-00463'
    'sub-00473'
    'sub-00474'
    'sub-00482'
    'sub-00486'
    'sub-00490'
    'sub-00492'
    'sub-00494'
    'sub-00495'
    'sub-00497'
    'sub-00536'
    'sub-00558'
    'sub-00570'
    'sub-00574'
    'sub-00579'
    'sub-00587'
    'sub-00593'
    'sub-00594'
    'sub-00610'
    'sub-00628'
    'sub-00644'
    'sub-00648'
    'sub-00683'
    'sub-00688'
    'sub-00693'
    'sub-00700'
    'sub-00703'
    'sub-00705'
    'sub-00706'
    'sub-00714'
    'sub-00716'
    'sub-00717'
    'sub-00726'
    'sub-00730'
    'sub-00732'
    'sub-00747'
    'sub-00751'
    'sub-00770'
    'sub-00775'
    'sub-00776'
    'sub-00778'
    'sub-00789'
    'sub-00791'
    'sub-00795'
    'sub-00803'
    'sub-00809'
    'sub-00826'
    'sub-00844'
    'sub-00847'
    'sub-00849'
    'sub-00851'
    'sub-00855'
    'sub-00857'
    'sub-00860'
    'sub-00863'
    'sub-00869'
    'sub-00870'
    'sub-00871'
    'sub-00878'
    'sub-00880'
    'sub-00886'
    'sub-00893'
    'sub-00897'
    'sub-00910'
    'sub-00914'
    'sub-00915'
    'sub-00917'
    'sub-00921'
    'sub-00926'
    'sub-00933'
    'sub-00936'
    'sub-00937'
    'sub-00940'
    'sub-00943'
    'sub-00944'
    'sub-00950'
    'sub-00951'
    'sub-00958'
    'sub-00960'
    'sub-00961'
    'sub-00965'
    'sub-00968'
    'sub-00970'
    'sub-00972'
    'sub-00975'
    'sub-00994'
    'sub-01008'
    'sub-01024'
    'sub-01025'
    'sub-01026'
    'sub-01034'
    'sub-01041'
    'sub-01043'
    'sub-01066'
    'sub-01067'
    'sub-01075'
    'sub-01109'
    'sub-01116'
    'sub-01118'
    'sub-01136'
    'sub-01147'
    'sub-01149'
    'sub-01155'
    'sub-01160'
    'sub-01161'
    'sub-01165'
    'sub-01185'
    'sub-01188'
    'sub-01190'
    'sub-01193'
    'sub-01206'
    'sub-01210'
    'sub-01214'
    'sub-01218'
    'sub-01247'
    'sub-01259'
    'sub-01264'
    'sub-01268'
    'sub-01271'
    'sub-01275'
    'sub-01277'
    'sub-01278'
    'sub-01282'
    'sub-01284'
    'sub-01286'
    'sub-01305'
    'sub-01317'
    'sub-01323'
    'sub-01329'
    'sub-01338'
    'sub-01364'
    'sub-01365'
    'sub-01376'
    'sub-01377'
    'sub-01388'
    'sub-01397'
    'sub-01398'
    'sub-01417'
    'sub-01420'
    'sub-01425'
    'sub-01435'
    'sub-01447'
    'sub-01453'
    'sub-01470'
    'sub-01485'
    'sub-01486'
    'sub-01489'
    'sub-01499'
    'sub-01501'
    'sub-01502'
    'sub-01507'
    'sub-01510'
    'sub-01512'
    'sub-01514'
    'sub-01519'
    'sub-01521'
    'sub-01527'
    'sub-01533'
    'sub-01540'
    'sub-01544'
    'sub-01558'
    'sub-01565'
    'sub-01567'
    'sub-01572'
    'sub-01579'
    'sub-01580'
    'sub-01582'
    'sub-01595'
    'sub-01615'
    'sub-01616'
    'sub-01618'
    'sub-01619'
    'sub-01625'
    'sub-01626'
    'sub-01659'
    'sub-01674'
    'sub-01676'
    'sub-01679'
    'sub-01685'
    'sub-01701'
    'sub-01707'
    'sub-01708'
    'sub-01715'
    'sub-01717'
    'sub-01727'
    'sub-01731'
    'sub-01734'
    'sub-01737'
    'sub-01741'
    'sub-01757'
    'sub-01762'
    'sub-01764'
    'sub-01774'
    'sub-01776'
    'sub-01778'
    'sub-01779'
    'sub-01785'
    'sub-01788'
    'sub-01789'
    'sub-01792'
    'sub-01796'
    'sub-01801'
    'sub-01804'
    'sub-01808'
    'sub-01816'
    'sub-01821'
    'sub-01823'
    'sub-01826'
    'sub-01832'
    'sub-01854'
    'sub-01856'
    'sub-01868'
    'sub-01877'
    'sub-01889'
    'sub-01890'
    'sub-01898'
    'sub-01900'
    'sub-01902'
    'sub-01903'
    'sub-01911'
    'sub-01916'
    'sub-01917'
    'sub-01927'
    'sub-01947'
    'sub-01952'
    'sub-01960'
    'sub-01970'
    'sub-01975'
    'sub-01982'
    'sub-01988'
    'sub-01999'
    'sub-02016'
    'sub-02032'
    'sub-02033'
    'sub-02040'
    'sub-02066'
    'sub-02072'
    'sub-02078'
    'sub-02079'
    'sub-02080'
    'sub-02127'
    'sub-02144'
    'sub-02148'
    'sub-02149'
    'sub-02150'
    'sub-02156'
    'sub-02165'
    'sub-02171'
    'sub-02176'
    'sub-02178'
    'sub-02193'
    'sub-02199'
    'sub-02205'
    'sub-02211'
    'sub-02226'
    'sub-02229'
    'sub-02250'
    'sub-02254'
    'sub-02260'
    'sub-02263'
    'sub-02271'
    'sub-02278'
    'sub-02285'
    'sub-02298'
    'sub-02300'
    'sub-02304'
    'sub-02305'
    'sub-02307'
    'sub-02309'
    'sub-02315'
    'sub-02316'
    'sub-02344'
    'sub-02345'
    'sub-02353'
    'sub-02371'
    'sub-02375'
    'sub-02377'
    'sub-02378'
    'sub-02416'
    'sub-02440'
    'sub-02460'
    'sub-02473'
    'sub-02476'
    'sub-02480'
    'sub-02494'
    'sub-02502'
    'sub-02507'
    'sub-02509'
)

##### dorso-caudal putamen
# Criar ou limpar o arquivo de saída
file_paths=""
concatenated_data="seed_DCPut_all4d.nii.gz"
output_names="lista_teste_DCPut.txt"
echo '' > "$output_names" 
# Iterar sobre os arquivos e adicionar ao arquivo de saída
for subject in "${sub_files[@]}"; do
    echo $subject
    filepath="./firstlevel_results/$subject/ses-1/func/${subject}_ses-1_task-rest_run-?_space-MNI152NLin2009cAsym_seed-DCPutamen_tstat.nii.gz"
    echo "$filepath" >> "${output_names} "
    file_paths+="${filepath} " 
    #echo $file_path
done

fslmerge -t "$concatenated_data" ${file_paths[@]}

##### dorso-rostral putamen
# Criar ou limpar o arquivo de saída
file_paths=""
concatenated_data="seed_DRPut_all4d.nii.gz"
output_names="lista_teste_DRPut.txt"
echo '' > "$output_names" 
# Iterar sobre os arquivos e adicionar ao arquivo de saída
for subject in "${sub_files[@]}"; do
    echo $subject
    filepath="./firstlevel_results/$subject/ses-1/func/${subject}_ses-1_task-rest_run-?_space-MNI152NLin2009cAsym_seed-DRPutamen_tstat.nii.gz"
    echo "$filepath" >> "${output_names} "
    file_paths+="${filepath} " 
    #echo $file_path
done
fslmerge -t "$concatenated_data" ${file_paths[@]}

##### ventro-rostral putamen
# Criar ou limpar o arquivo de saída
file_paths=""
concatenated_data="seed_VRPut_all4d.nii.gz"
output_names="lista_teste_VRPut.txt"
echo '' > "$output_names" 
# Iterar sobre os arquivos e adicionar ao arquivo de saída
for subject in "${sub_files[@]}"; do
    echo $subject
    filepath="./firstlevel_results/$subject/ses-1/func/${subject}_ses-1_task-rest_run-?_space-MNI152NLin2009cAsym_seed-VRPutamen_tstat.nii.gz"
    echo "$filepath" >> "${output_names} "
    file_paths+="${filepath} " 
    #echo $file_path
done
fslmerge -t "$concatenated_data" ${file_paths[@]}

##### dorso caudado
# Criar ou limpar o arquivo de saída
file_paths=""
concatenated_data="seed_DorsalCaudate_all4d.nii.gz"
output_names="lista_teste_DorsalCaudate.txt"
echo '' > "$output_names" 
# Iterar sobre os arquivos e adicionar ao arquivo de saída
for subject in "${sub_files[@]}"; do
    echo $subject
    filepath="./firstlevel_results/$subject/ses-1/func/${subject}_ses-1_task-rest_run-?_space-MNI152NLin2009cAsym_seed-DorsalCaudate_tstat.nii.gz"
    echo "$filepath" >> "${output_names} "
    file_paths+="${filepath} " 
    #echo $file_path
done
fslmerge -t "$concatenated_data" ${file_paths[@]}

##### InfVentralCaudate
# Criar ou limpar o arquivo de saída
file_paths=""
concatenated_data="seed_InfVentralCaudate_all4d.nii.gz"
output_names="lista_teste_InfVentralCaudate.txt"
echo '' > "$output_names" 
# Iterar sobre os arquivos e adicionar ao arquivo de saída
for subject in "${sub_files[@]}"; do
    echo $subject
    filepath="./firstlevel_results/$subject/ses-1/func/${subject}_ses-1_task-rest_run-?_space-MNI152NLin2009cAsym_seed-InfVentralCaudate_tstat.nii.gz"
    echo "$filepath" >> "${output_names} "
    file_paths+="${filepath} " 
    #echo $file_path
done
fslmerge -t "$concatenated_data" ${file_paths[@]}

##### SupVentralCaudate
# Criar ou limpar o arquivo de saída
file_paths=""
concatenated_data="seed_SupVentralCaudate_all4d.nii.gz"
output_names="lista_teste_SupVentralCaudate.txt"
echo '' > "$output_names" 
# Iterar sobre os arquivos e adicionar ao arquivo de saída
for subject in "${sub_files[@]}"; do
    echo $subject
    filepath="./firstlevel_results/$subject/ses-1/func/${subject}_ses-1_task-rest_run-?_space-MNI152NLin2009cAsym_seed-SupVentralCaudate_tstat.nii.gz"
    echo "$filepath" >> "${output_names} "
    file_paths+="${filepath} " 
    #echo $file_path
done
fslmerge -t "$concatenated_data" ${file_paths[@]}

mv ./seed_DCPut_all4d.nii.gz ./second_level_analysis
mv ./seed_DRPut_all4d.nii.gz ./second_level_analysis
mv ./seed_VRPut_all4d.nii.gz ./second_level_analysis
mv ./seed_DorsalCaudate_all4d.nii.gz ./second_level_analysis
mv ./seed_InfVentralCaudate_all4d.nii.gz ./second_level_analysis
mv ./seed_SupVentralCaudate_all4d.nii.gz ./second_level_analysis