#Extracting numerical stability values from SHEMAT logfile.log (Courant, Neumann and Peclet)
#Variables to consider
	# $1 -> directory of logfile


echo 'Extracting Courant values to text file'
grep -A 3 'Courant-Number in x,y,z' $1 > courant.txt
grep -A 2 'Max.' courant.txt > courant2.txt
mv courant2.txt courant.txt

echo 'Extracting Neumann values to text file'
grep -A 3 'Temperature-Neumann-Number in x,y,z' $1 > neumann.txt
grep -A 2 'Max.' neumann.txt > neumann2.txt
mv neumann2.txt neumann.txt

echo 'Extracting Peclet values to text file'
grep -A 3 'Temperature-Peclet-Number in x,y,z' $1 > peclet.txt
grep -A 2 'Max.' peclet.txt > peclet2.txt
mv peclet2.txt peclet.txt #removes version 2 file

echo 'Done'

#Need to transform lines to csv files
