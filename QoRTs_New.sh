#!/bin/bash -l
#SBATCH -J QoRTs_new
#SBATCH -N 1 
#SBATCH --ntasks-per-node 4
#SBATCH --mem 4gb
#SBATCH --time=02:00:00
#SBATCH --mail-type=ALL 

QORTS_JAR="/path/to/QoRTs.jar"
INPUT_BAM="/path/to/Controlrep1Aligned.sortedByCoord.out.bam"
ANNOTATION_GTF="/path/to/Arabidopsis_thaliana.TAIR10.42.gtf"
OUTPUT_DIR="QoRTs_out_new/Controlrep1/"

java -Xmx4G -jar /QoRTs-master/QoRTs.jar QC \
  --stranded \
  --runFunctions writeKnownSplices,writeNovelSplices,writeSpliceExon \
  --inputBam "$INPUT_BAM" \
  --annotationGTF "$ANNOTATION_GTF" \
  --outputDir "$OUTPUT_DIR"
