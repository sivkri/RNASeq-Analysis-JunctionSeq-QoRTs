#!/bin/bash -l
#SBATCH -J QoRts_new
#SBATCH -N 1 
#SBATCH --ntasks-per-node 4
#SBATCH --mem 4gb
#SBATCH --time=02:00:00
#SBATCH --mail-type=ALL 

java -Xmx4G -jar /QoRTs-master/QoRTs.jar QC \--stranded \--runFunctions writeKnownSplices,writeNovelSplices,writeSpliceExon \/Controlrep1Aligned.sortedByCoord.out.bam \Arabidopsis_thaliana.TAIR10.42.gtf \QoRTs_out_new/Controlrep1/
