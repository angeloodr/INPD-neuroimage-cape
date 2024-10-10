from bids import BIDSLayout
from bids.tests import get_test_data_path
import os
# Here we're using an example BIDS dataset that's bundled with the pybids tests
data_path = os.path.join(get_test_data_path(), '7t_trt')

# Initialize the layout
### $$ aqui pode ser qualquer diretório que esteja entruturado em BIDS ai é so colocar o caminho
layout = BIDSLayout('.//fmrianalysis//Lib//site-packages//bids//tests//data//7t_trt')#,derivatives=False)

# Print some basic information about the layout
layout
### $$ o get é pra pegar as informações dentro do diretório BIDS
all_files = layout.get()
print("There are {} files in the layout.".format(len(all_files)))
print("\nThe first 10 files are:")
for i in range(10):
    print(all_files[i])

print('\n ### Retrieve filenames of all BOLD runs for subject 01')
for i in (layout.get(subject='01', extension='nii.gz', suffix='bold', return_type='filename')): print(i)

print('\n ##Retrieve all files where SamplingFrequency (a metadata key) = 100')
# and acquisition = prefrontal, for the first two subjects
### $$ O get também vai avaliar o metadado e vai poder fazer selções baseadas nele 
for i in layout.get(subject=['01', '02'], SamplingFrequency=100, acquisition="prefrontal"): print(i)

print('\nAsk get() to return the ids of subjects that have T1w files')
for i in layout.get(return_type='id', target='subject', suffix='T1w'): print(i)

print('\n print specific type of file')
for i in layout.get(return_type='dir', target='subject'): print(i)

# Pick the 15th file in the dataset
bf = layout.get()[15]

print('\n Print all the entities associated with this file, and their values')
print(bf.get_entities())

# We can the union of both of the above in one shot like this
print(bf.get_entities(metadata='all'))

# Use a different test dataset--one that contains physio recording files
data_path = os.path.join(get_test_data_path(), 'synthetic')
layout2 = BIDSLayout(data_path)

# Get the first physiological recording file
recfile = layout2.get(suffix='physio')[0]

# Get contents as a DataFrame and show the first few rows
df = recfile.get_df()
print(df.head())