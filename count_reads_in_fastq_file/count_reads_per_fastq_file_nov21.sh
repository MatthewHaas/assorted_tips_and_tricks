#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=32
#SBATCH --time=24:00:00
#SBATCH --mem=30g
#SBATCH --mail-type=ALL
#SBATCH --mail-user=haasx092@umn.edu
#SBATCH -p amdsmall
#SBATCH --account=jkimball
#SBATCH -o count_reads_per_fastq_file_nov_21.out
#SBATCH -e count_reads_per_fastq_file_nov_21.err

cd /scratch.global/haasx092/reneth_gwas

for i in $(cat nov21_fastq_list.txt);
do
echo $(zcat ${i} | wc -l)/4|bc >> nov21_fastq_read_count.txt
done
