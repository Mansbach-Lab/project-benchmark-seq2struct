#!/bin/bash
#SBATCH --job-name=gl13k_8peptides
#SBATCH --account=ctb-rmansbac
#SBATCH --time=02:00:00
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=1
#SBATCH --gpus-per-node=1
#SBATCH --mem=24G

# Assumes running from project-benchmark-seq2struct directory

# load modules/venv
source venv/bin/activate
module load StdEnv/2020 cuda/11.4 gcc/9.3.0 openmpi/4.0.3
module load openmm/8.0.0

# "outputs/" is deep learning model outputs, but MD sim inputs
python scripts/simulate_protein_in_water.py --input_dir inputs/ --pdb_file GL13K_8peptides_AF2_pdbfixed.pdb --output_dir outputs/gl13k/ --slurm_id $SLURM_JOB_ID --prefix barrel10ns
echo Done.
