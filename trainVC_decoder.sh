#!/bin/bash

#SBATCH --partition=gpu
#SBATCH --gres=gpu:tesla:2
#SBATCH --exclude=falcon1,falcon2,falcon3  

#SBATCH -J cotatron_vc

#The job requires 1 compute node
#SBATCH -N 1

#The job requires 1 task per node
#SBATCH --ntasks-per-node=1
#SBATCH --mem-per-cpu=32G

#SBATCH -t 48:00:00

#These commands are run on one of the nodes allocated to the job (batch node)

# Prepare environment
module load python-3.6.3
source /storage/software/python-3.6.3/miniconda3/etc/profile.d/conda.sh

conda activate cotatron_env

python synthesizer_trainer.py -c config/global/default.yaml config/vc/default.yaml -g 1 -n cotatron_trained_vc -p chkpt/vc/cotatron_trained_vc/05e2f42epoch=95.ckpt
