# splicing-variants-QoRTS-and-JunctionSeq

Step 1 - transcriptome.gtf file is required

Step 2-  Qorts.sh

Step 3 - QoRTs_Sample.sh

Step 4 - QorTs.txt


# RNASeq-Analysis-JunctionSeq-QoRTs

**This repository contains scripts for RNA-Seq data analysis using JunctionSeq and QoRTs**

## Table of Contents
- [Code 1: Control_Junctionseq.R](#code-1-control_junctionseqr)
- [Code 2: QoRTs_New.sh](#code-2-qorts_newsh)
- [Code 3: QoRTs_Sample.sh](#code-3-qorts_samplesh)
- [Code 4: QorTs.txt](#code-4-qortstxt)

## Code 1: Control_Junctionseq.R

### Description
The `Control_Junctionseq.R` script performs RNA-Seq data analysis using the JunctionSeq package. It includes the following steps:
1. Sets the working directory to the specified path.
2. Loads the JunctionSeq library.
3. Runs JunctionSeq analyses on the provided sample files.
4. Writes size factors to a file.
5. Builds plots for visualization.
6. Plots dispersion estimates.
7. Generates an MA plot.
8. Writes complete results to files.

### Usage
To use this script, follow these steps:
1. Set the working directory using `setwd()` to the desired location of the RNA-Seq data.
2. Install the JunctionSeq library if not already installed using `install.packages("JunctionSeq")`.
3. Modify the `sample.files`, `sample.names`, `condition`, `flat.gff.file`, `nCores`, and `analysis.type` variables according to your data.
4. Run the script in an R environment.

## Code 2: QoRTs_New.sh

### Description
The `QoRTs_New.sh` script performs quality control and analysis using the QoRTs tool. It includes the following steps:
1. Sets the SLURM job parameters.
2. Runs QoRTs with the specified parameters, including strandedness, functions to run, input files, and output directory.

### Usage
To use this script, follow these steps:
1. Set the SLURM job parameters in the script header (e.g., `#SBATCH -N`, `#SBATCH --mem`, `#SBATCH --time`, `#SBATCH --mail-type`).
2. Modify the QoRTs command to specify the correct input files, annotation file, and output directory.
3. Run the script on a SLURM-based cluster or adjust it for local execution.

## Code 3: QoRTs_Sample.sh

### Description
The `QoRTs_Sample.sh` script performs data preparation and analysis using the QoRTs tool. It includes the following steps:
1. Sets the SLURM job parameters.
2. Sets environment variables for temporary directories.
3. Copies input files to the temporary directory.
4. Changes the working directory to the temporary directory.
5. Runs QoRTs with the specified parameters, including strandedness, minimum mapping quality, functions to run, input files, and output directory.
6. Copies the output files back to the original output directory.

### Usage
To use this script, follow these steps:
1. Set the SLURM job parameters in the script header (e.g., `#SBATCH -N`, `#SBATCH --mem`, `#SBATCH --time`, `#SBATCH --mail-type`).
2. Modify the QoRTs command to specify the correct input files, annotation file, and output directory.
3. Modify the variables `INPUT_DIR` and `OUTPUT_DIR` to match your directory structure.
4. Run the script on a SLURM-based cluster or adjust it for local execution.

## Code 4: QorTs.txt



### Description
The `QorTs.txt` file contains a series of commands for data processing, QC, merging replicates, performing differential splicing analyses, and generating browser tracks using QoRTs.

### Usage
To use this script, follow these steps:
1. Create the necessary output directories as specified in the commands.
2. Modify the paths to the input files, output directories, and any other relevant parameters in each step.
3. Run the commands step-by-step in the specified order.

## License

This repository is licensed under the [MIT License](LICENSE).
