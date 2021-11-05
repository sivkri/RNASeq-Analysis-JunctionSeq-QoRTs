#!/bin/bash -l
#SBATCH -J preps
#SBATCH -N 1 
#SBATCH --ntasks-per-node 4
#SBATCH --mem 4gb
#SBATCH --time=01:00:00
#SBATCH --mail-type=ALL 
#SBATCH --mail-user=sivkri@amu.edu.pl

export TMPDIR="/tmp/lustre_shared/${USER}/${SLURM_JOBID}"
export SCR=${TMPDIR}
mkdir -p ${TMPDIR}
cp ${SLURM_SUBMIT_DIR}/${INPUT_DIR}/* ${TMPDIR}
cd $TMPDIR

java -Xmx4G -jar /QoRTs-master/QoRTs.jar QC \ 
	--stranded --minMAPQ 50 \
	--runFunctions writeKnownSplices,writeNovelSplices,writeSpliceExon \
	/ABI1rep1Aligned.sortedByCoord.out.bam \
	transcriptome.gtf \ 
	QoRTs_out/1/

mkdir $SLURM_SUBMIT_DIR/${OUTPUT_DIR}
cp -r $TMPDIR/* $SLURM_SUBMIT_DIR/${OUTPUT_DIR}/

