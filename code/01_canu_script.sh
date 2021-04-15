#!/bin/bash -l
#SBATCH -A g2021012
#SBATCH -M snowy
#SBATCH -p core
#SBATCH -n 2
#SBATCH -t 16:00:00
#SBATCH -J 01_canu
#SBATCH --mail-type=ALL
#SBATCH --mail-user linnea.gauffingood.6719@student.uu.se
# Load modules
module load bioinfo-tools
module load canu
# Your commands
canu -d GenomeAnalysis/analyses/01_GenomeAssembly/ -p assembly genomeSize=3m -pacbio raw_data/DNA_raw_data/ERR2028*
