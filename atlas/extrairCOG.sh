echo ROI X Y Z  COG_table.txt

for f in roi_*.nii; do
    coords=$(fslstats $f -c)
    echo $f $coords >> 0_COG_table.txt
done