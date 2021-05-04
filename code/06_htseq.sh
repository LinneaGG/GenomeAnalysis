#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 01:30:00
#SBATCH -J 06_htseq_10
#SBATCH --mail-type=ALL
#SBATCH --mail-user linnea.gauffingood.6719@student.uu.se

# Load modules
module load bioinfo-tools
module load htseq 
module load samtools 

# Change job name, input name and output name for each run

path=/home/linne/genome_analysis/GenomeAnalysis/analyses/06_mapping_diffexp

samtools index -@ 2 ${path}/bwa_output_10.bam
htseq-count -f bam -r pos -i ID -s reverse -t CDS ${path}/bwa_output_10.bam /home/linne/genome_analysis/GenomeAnalysis/analyses/03_annotation/annotation/fixed_annotation.gff > /home/linne/genome_analysis/GenomeAnalysis/analyses/06_mapping_diffexp/htseq/htseq_out_10_continuous.txt

