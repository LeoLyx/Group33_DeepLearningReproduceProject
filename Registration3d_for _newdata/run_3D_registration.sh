#!/usr/bin/bash

#Define counter
num1=0
num2=0

#Define the text file for saving the results
result_log_lambda2=/home/leo/Documents/dp_re/NODEO-DIR/result_lambda2.txt
result_dice_log_lambda2=/home/leo/Documents/dp_re/NODEO-DIR/result_dice_lambda2.txt

result_log_lambda2_5=/home/leo/Documents/dp_re/NODEO-DIR/result_lambda2_5.txt
result_dice_log_lambda2_5=/home/leo/Documents/dp_re/NODEO-DIR/result_dice_lambda2_5.txt

#Check if the result text file already exists, if so overwrites it, if no create it
if [ -f "$result_log_lambda2" ]; then
    echo "$result_log_lambda2 exists."
	rm result_lambda2.txt
	touch result_lambda2.txt
else 
    echo "$result_log_lambda2 does not exist."
	touch result_lambda2.txt
fi

if [ -f "$result_dice_log_lambda2" ]; then
    echo "$result_dice_log_lambda2 exists."
	rm result_dice_lambda2.txt
	touch result_dice_lambda2.txt
else 
    echo "$result_dice_log_lambda2 does not exist."
	touch result_dice_lambda2.txt
fi

if [ -f "$result_log_lambda2_5" ]; then
    echo "$result_log_lambda2_5 exists."
	rm result_lambda2_5.txt
	touch result_lambda2_5.txt
else 
    echo "$result_log_lambda2_5 does not exist."
	touch result_lambda2_5.txt
fi

if [ -f "$result_dice_log_lambda2_5" ]; then
    echo "$result_dice_log_lambda2_5 exists."
	rm result_dice_lambda2_5.txt
	touch result_dice_lambda2_5.txt
else 
    echo "$result_dice_log_lambda2_5 does not exist."
	touch result_dice_lambda2_5.txt
fi

#Run the python scripts over the whole dataset

echo "============lambda = 2.0============"

for files in /home/leo/Documents/dp_re/NODEO-DIR/data/Moving/*; do
	echo "============Starting the ${num1} th run============"
	echo "the ${num1} th run">>/home/leo/Documents/dp_re/NODEO-DIR/result_lambda2.txt
	files_norm="${files}/aligned_norm.nii.gz"
	files_seg="${files}/aligned_seg35.nii.gz"
	echo "Using ${files} as the moving image for the registration"
    python /home/leo/Documents/dp_re/NODEO-DIR/Registration_onestep.py --moving  $files_norm --moving_seg $files_seg 
	num1=$((num1+1))
	echo "================END==============="
done

echo "============lambda = 2.5============"

for files in /home/leo/Documents/dp_re/NODEO-DIR/data/Moving/*; do
	echo "============Starting the ${num2} th run============"
	echo "the ${num2} th run">>/home/leo/Documents/dp_re/NODEO-DIR/result_lambda2_5.txt
	files_norm="${files}/aligned_norm.nii.gz"
	files_seg="${files}/aligned_seg35.nii.gz"
	echo "Using ${files} as the moving image for the registration"
    python /home/leo/Documents/dp_re/NODEO-DIR/Registration_onestep2.py --moving  $files_norm --moving_seg $files_seg 
	num2=$((num2+1))
	echo "================END==============="
done
echo "============ALL RUN FINISHED============"
