#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 8:00:00
#SBATCH -J 06_bwa
#SBATCH --mail-type=ALL
#SBATCH --mail-user linnea.gauffingood.6719@student.uu.se

# Load modules
module load bioinfo-tools
module load bwa
module load samtools 

cd /home/linne/genome_analysis/GenomeAnalysis/analyses/01_genome_assembly 

bwa index -p bwa_index assembly.contigs.fasta

cd /home/linne/genome_analysis/raw_data/RNA_trimmed_reads

counter1=1

for i in *P1* 
do
	counter2=1 

	for j in *P2* 
	do 

		if [[ $counter1 -eq $counter2 ]] 
		then
		
			bwa mem -t 2 /home/linne/genome_analysis/GenomeAnalysis/analyses/01_genome_assembly/bwa_index $i $j | samtools sort -@2 -o /home/linne/genome_analysis/GenomeAnalysis/analyses/06_mapping_diffexp/bwa_output_${counter1}.bam - 
			  
		fi

		counter2=$((counter2+1))
	done 

counter1=$((counter1+1))

done 
