#!/bin/sh

#SBATCH --ntasks=1
#SBATCH -t 04:00:00               # max runtime is 4 hours
#SBATCH -J  tensorboard_server    # name
#SBATCH -o tb-%J.out #TODO: Where to save your output

source /gpfs/space/home/zuppur/.bash_profile #TODO: Your profile
MODEL_DIR=logs/cota/cotatron_trained #TODO: Your TF model directory

let ipnport=($UID-6025)%65274
echo ipnport=$ipnport

ipnip=$(hostname -i)
echo ipnip=$ipnip

module load cuda/8.0 #TODO: Your Cuda Module if required

tensorboard --logdir="${MODEL_DIR}" --port=$ipnport
