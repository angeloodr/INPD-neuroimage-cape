#!/bin/bash
#descompacta arquivos .tar.gz
# This code is created by Angelo Orletti Del Rey working on Psychiatry Master's degree in Universidade Federal de São Paulo - Unifesp
# Arquivo de texto com nomes dos arquivos .tar.gz
arquivo_texto="all_subj_list.txt"

# Caminho para o drive externo
destino=/media/escience/Elements

# Loop para cada arquivo no arquivo de texto
for arquivo in `cat $arquivo_texto`; do
    echo "===> Starting processing of $arquivo"

    # Descompacte o arquivo
    tar -xf "$arquivo"

    echo "arquivo $arquivo descompactado"

    # Mova a pasta descompactada para o drive externo
    mv ./$arquivo $destino
     
    echo "arquivo $arquivo movido para o HD externo"

    echo "Pasta descompactada de '$arquivo' movida para '$destino' com sucesso."

done