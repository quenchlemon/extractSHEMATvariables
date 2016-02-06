#Extracting numerical stability values from SHEMAT logfile.log (Courant, Neumann and Peclet)
#Variables to consider
	# $1 -> directory of logfile

# solution taken from $sh-to-extract-numbers-and-convert-to-csv-file

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

echo 'Done'

