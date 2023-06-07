# Set the working directory to the RNA-Seq data folder
setwd("E:/RNA Seq Data Analysis/JunctionSeq/Control/New")

# Load the JunctionSeq library
library("JunctionSeq", lib.loc = "~/R/win-library/3.5")

# Define the sample files, sample names, and conditions
sample.files <- c(
  "Controlrep1/QC.spliceJunctionAndExonCounts.forJunctionSeq.txt.gz",
  "Controlrep2/QC.spliceJunctionAndExonCounts.forJunctionSeq.txt.gz",
  "Controlrep3/QC.spliceJunctionAndExonCounts.forJunctionSeq.txt.gz",
  "Controlrep4/QC.spliceJunctionAndExonCounts.forJunctionSeq.txt.gz",
  "Controlrep5/QC.spliceJunctionAndExonCounts.forJunctionSeq.txt.gz",
  "Controlrep6/QC.spliceJunctionAndExonCounts.forJunctionSeq.txt.gz"
)
sample.names <- c("1", "2", "3", "4", "5", "6")
condition <- factor(c("CTRL", "CTRL", "CTRL", "CASE", "CASE", "CASE"))

# Specify the path to the GFF file
flat.gff.file <- "Arabidopsis_thaliana.TAIR10.42.gff.gz"

# Set the number of cores to be used
nCores <- 4

# Define the analysis type
analysis.type <- "junctionsAndExons"

# Run JunctionSeq analyses
jscs <- runJunctionSeqAnalyses(
  sample.files = sample.files,
  sample.names = sample.names,
  condition = condition,
  flat.gff.file = flat.gff.file,
  nCores = nCores,
  analysis.type = analysis.type
)

# Write size factors to a file
writeSizeFactors(jscs, file = "sizeFactors.txt")

# Build all plots for visualization
buildAllPlots(
  jscs = jscs,
  outfile.prefix = "WT_Treatment_effect_New_plots",
  use.plotting.device = "png",
  FDR.threshold = 0.01
)

# Plot dispersion estimates
plotDispEsts(jscs)

# Generate an MA plot
plotMA(jscs, FDR.threshold = 0.05)

# Write complete results to files
writeCompleteResults(
  jscs,
  outfile.prefix = "WT_Treatment_effect",
  gzip.output = TRUE,
  FDR.threshold = 0.01,
  save.allGenes = TRUE,
  save.sigGenes = TRUE,
  save.fit = FALSE,
  save.VST = FALSE,
  save.bedTracks = TRUE,
  save.jscs = FALSE,
  bedtrack.format = c("BED", "GTF", "GFF3"),
  verbose = TRUE
)
