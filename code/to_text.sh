#! /usr/bin/env bash 

# Shell script to cut the filename from the list of docx files
# and then convert to plain text the associated MSWord docx files
# using pandoc. 
#
# script is to run from the project main directory with the 
# data files in ./data and the ouput going to ./results

fpath='./data/area_reports'
opath='./results/text/'

for filename in $fpath/*.docx
do
	echo $filename
	fname=`echo "$filename" | cut -d'/' -f4 | cut -d'.' -f1`
	echo "Creating plain text file:" $opath$fname".txt"
	pandoc -s $filename -t plain -o $opath$fname'.txt'
	echo ' '

done
echo "Done!"