#!/bin/bash
#SBATCH --nodes 1
#SBATCH --partition gpu
#SBATCH --time 02:00:00
#SBATCH --mem 10000
#SBATCH --gres=gpu:tesla:1

module load python-3.6.3
source /storage/software/python-3.6.3/miniconda3/etc/profile.d/conda.sh

conda activate cotatron_env
jupyter-start
