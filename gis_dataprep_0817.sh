#!/bin/bash
  
#The following line of code is only for debugging purpose
#Delete when working fine
#cd /Users/sj577/Documents/pneumo_India/hmis_yearly/
#rm *.csv
#rm -r MonthUpToMarch
#cp -r /Users/sj577/Documents/pneumo_India/hmis_yearly/2017-2018/MonthUpToMarch .

echo $1

cd /Users/sj577/Documents/pneumo_India/hmis_yearly/processed_data/$1/MonthUpToMarch/
pwd
# remove the file containing all India data
rm -r *INDIA*
ls
#Remove whitespaces from names of the directory
for d in *\ *; do mv "$d" "${d// /_}"; done
ls
for dir in *
        do
                cd ${dir}
                #Remove whitespaces from filenames
                #for f in *\ *; do mv "$f" "${f// /_}"; done
                #Change the Child Health excel file to html
                mv Child*.xls ${dir}_ChildHealth.htm
                Rscript --vanilla /Users/sj577/Documents/pneumo_India/hmis_pneumo_08_17.R ${dir}_ChildHealth.htm ${dir}_pneumo.csv
                pwd
                cd ..
        done

#Move all output files to main folder
cd /Users/sj577/Documents/pneumo_India/hmis_yearly/processed_data/$1
cp **/**/*pneumo.csv .

#Combine output files
#Navigate to main directory
cd /Users/sj577/Documents/pneumo_India/hmis_yearly/processed_data/$1
MainFileName="$1.csv"                       # Fix the output name
i=0                                       # Reset a counter
for filename in *.csv
        do
                if [ "$filename"  != "$MainFileName" ] ;      # Avoid recursion
                then
                if [[ $i -eq 0 ]]
                then
                head -1  $filename >   $MainFileName # Copy header if it is the first file
                fi
                tail -n +2  $filename >>  $MainFileName # Append from the 2nd line each file
                i=$(( $i + 1 ))                        # Increase the counter
                fi
        done
