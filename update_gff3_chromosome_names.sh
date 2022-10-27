#!/bin/bash -l
#SBATCH --nodes=1
#SBATCH --ntasks=32
#SBATCH --time=12:00:00
#SBATCH --mem=30g
#SBATCH --mail-type=ALL
#SBATCH --mail-user=haasx092@umn.edu
#SBATCH -p amdsmall
#SBATCH --account=jkimball
#SBATCH -o update_chromosome_names_in_gff3.out
#SBATCH -e update_chromosome_names_in_gff3.err


cd /home/jkimball/haasx092

# Put code here
while IFS=$'\t' read -r -a myArray
do
old_gene=${myArray[0]}
new_gene=${myArray[1]}
sed -i 's/\<'$old_gene'\>/'$new_gene'/g' rice.gene_structures_post_PASA_updates.21917.reordered_COPY.gff3
echo $old_gene
echo $new_gene
done < contig_mapping_table2.txt
