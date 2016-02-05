#Extracting numerical stability values from SHEMAT logfile.log (Courant, Neumann and Peclet)
#Variables to consider
	# $1 -> directory of logfile


echo 'Extracting Courant values to text file'
grep -A 3 'Courant-Number in x,y,z' $1 > courant.txt

echo 'Extracting Neumann values to text file'
grep -A 3 'Temperature-Neumann-Number in x,y,z' $1 > neumann.txt

echo 'Extracting Peclet values to text file'
grep -A 3 'Temperature-Peclet-Number in x,y,z' $1 > peclet.txt

echo 'Done'

#Need to transform lines to csv files
