#!/bin/bash

#SBATCH --partition=gpu
#SBATCH --gres=gpu:tesla:1

#The name of the job is test_job
#SBATCH -J test_job

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1

#The maximum walltime of the job is a half hour
#SBATCH -t 00:30:00

#These commands are run on one of the nodes allocated to the job (batch node)

# Prepare environment
module load python-3.6.3
source /storage/software/python-3.6.3/miniconda3/etc/profile.d/conda.sh

conda activate cotatron_env

python cotatron_trainer.py -c config/global/default.yaml config/cota/default.yaml -g 0 -n my_runname
