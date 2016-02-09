# Extracting numerical stability values from SHEMAT logfile.log (Courant, Neumann and Peclet)
#
# To use:
	# bash extractSHEMATaccterms.sh logfile.log
# Variables to consider
	# $1 -> directory of logfile

# solution taken from $sh-to-extract-numbers-and-convert-to-csv-file
# Produces three CSVs (Courant, Neumann and Peclet) with data for 9 columns (Max_x,y,z, Min_x,y,z, Avg_x,y,z)

echo 'Extracting Courant values to text file'
grep -A 3 'Courant-Number in x,y,z' $1 | #find courant number + 3 lines
	grep -A 2 'Max.' | # fix max + 2 following lines
	grep -v -- '--' | # get rid of lines that have '--'
	sed 's/^.*://' | #get rid of min: max: avg:
	paste -d "," - - - | #join every three lines with commas
	sed 's/ *//g' > courant.csv # get rid of whitespace and write to 
file

echo 'Extracting Neumann values to text file'
grep -A 3 'Temperature-Neumann-Number in x,y,z' $1 |
	grep -A 2 'Max.' | # fix max + 2 following lines
        grep -v -- '--' | # get rid of lines that have '--'
        sed 's/^.*://' | # get rid of min: max: avg:
        paste -d "," - - - | # join every three lines with commas
        sed 's/ *//g' > neumann.csv # get rid of whitespace and write to 
file

echo 'Extracting Peclet values to text file'
grep -A 3 'Temperature-Peclet-Number in x,y,z' $1 |
	grep -A 2 'Max.' | # fix max + 2 following lines
        grep -v -- '--' | # get rid of lines that have '--'
        sed 's/^.*://' | # get rid of min: max: avg:
        paste -d "," - - - | # join every three lines with commas
        sed 's/ *//g' > peclet.csv # get rid of whitespace and write to 
file

echo 'Add header lines for csv'

sed -i.bak 1i"Max_x,Max_y,Max_z,Min_x,Min_y,Min_z,Avg_x,Avg_y,Avg_z" courant.csv
sed -i.bak 1i"Max_x,Max_y,Max_z,Min_x,Min_y,Min_z,Avg_x,Avg_y,Avg_z" neumann.csv
sed -i.bak 1i"Max_x,Max_y,Max_z,Min_x,Min_y,Min_z,Avg_x,Avg_y,Avg_z" peclet.csv

echo 'Removing extra files' # above commands replaces original files with .bak extension
rm *.bak

echo 'Done'

