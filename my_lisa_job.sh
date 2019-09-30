#!/bin/bash
#SBATCH -t 00:10:00 (wall clock time)
#SBATCH -N 1 
#SBATCH -p short
#SBATCH --mail-type=BEGIN,END
#SBATCH --mail-user=m.galland@uva.nl

# Explanations
# wall clock time: -t 00:10:00 (here 10min)
# Number of nodes: -N 1 (here one node)
# number of tasks per node: --tasks-per-node 16

# Output directory
mkdir "$HOME"/results/ 

# activate the pipeline environment
conda activate snakemake_env

# Actual program
snakemake --rulegraph |dot -Tpng > "$HOME"/results/dag.png

