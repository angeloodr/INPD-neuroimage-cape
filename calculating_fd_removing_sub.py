'''
This code is created by Angelo Orletti Del Rey working on Psychiatry Master's degree in Universidade Federal de São Paulo - Unifesp

The objective here is to calculate the framewise displacement mean and count how many times it is higher than 0.2mm to check the quality of the image
'''

import numpy as np
import os, sys
import bids
import pandas as pd

os.environ["ROOTDIR"] = 'mnt/imagem_2/BIDS'  # seth path
rootdir = os.environ["ROOTDIR"]

options = {}
workdir = os.environ["ROOTDIR"]
derivat = os.path.join(workdir,"devivatives")
output  = os.path.join(workdir,"metadata")
masks = os.path.join(workdir,"masks")
participants = []

print('Rawdata: ', derivat)

bidslayout = bids.BIDSLayout(derivat, derivatives=True, validate=False)  
# With validate = True it doesn't find any subjects
participants = bidslayout.get_subjects()

#the value of mean and cont high was added as a suggestions of João Sato UFABC
fd_mean, fd_mean_value, name_of_files, fd_count_high, fd_count_high_value = [], [], [], [], []
for i in  participants:
    print("Subject: ", i)
    i = i.replace("sub-", "")
    for ses in bidslayout.get_sessions(subject=i):
        print("Session: ", ses)
        #for multi-echo files, apply transform to standard space
        for r in bidslayout.get_runs(subject=i, session=ses):
            print("Run:", r)

            # setting up the data and cheking the existance afterwards for BOLD images
            filesrest = bidslayout.get(subject=i,
                            session=ses,
                            run=r,
                            extension=".nii.gz",
                            suffix="bold",
                            space="MNI152NLin2009cAsym",
                            #regex_search=True,
                            #invalid_filters="allow"
                            )

            print("Filerest:", filesrest)
            if len(filesrest)>1:
                print(f"More than one file match bold filters. Subject {i}, ses {ses}, run {r}")
                continue
            elif len(filesrest)<1:
                print(f"No file match bold filters. Subject {i}, ses {ses}, run {r}")
                continue
            bold = filesrest[0]
            
            #Load Confounds
            confounds_ents = {}
            confounds_ents["subject"] = bold.entities['subject']
            confounds_ents["session"] = bold.entities['session']
            #confounds_ents["acquisition"] = bold.entities['acquisition']
            confounds_ents["run"] = bold.entities['run']
            confounds_ents["task"] = bold.entities['TaskName']
            #confounds_ents['desc'] = "confounds"
            confounds_ents['suffix'] = "timeseries"
            confounds_ents['extension'] = ".tsv"
            confounds = bidslayout.get(return_type='file', **confounds_ents, invalid_filters="allow")[0]
            allconfounds_df = pd.read_csv(confounds, sep='\t')

            # this is from https://doi.org/10.1073/pnas.1502829112 article, from https://wiki.cam.ac.uk/bmuwiki/FMRI website
            fd_count_high.append(np.sum(allconfounds_df['framewise_displacement'] > 0.25) > 20)
            fd_mean.append(allconfounds_df['framewise_displacement'].mean()> 0.2)
            name_of_files.append(bold.filename)
            # this part was added as a suggestions of Joao Sato - UFABC
            fd_count_high_value.append(np.sum(allconfounds_df['framewise_displacement'] > 0.25))
            fd_mean_value.append(allconfounds_df['framewise_displacement'].mean())

sub_list_fd = pd.DataFrame({'file_name': name_of_files,'fd_mean': fd_mean  , 'fd_count_high': fd_count_high })
sub_list_fd.to_csv(os.path.join(output, 'sub_list_fd.csv'), index=False)