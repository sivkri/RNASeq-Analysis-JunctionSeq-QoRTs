
setwd("E:/RNA Seq Data Analysis/JunctionSeq/Control/New")

library("JunctionSeq", lib.loc="~/R/win-library/3.5")

jscs <- runJunctionSeqAnalyses(sample.files = c(
  "Controlrep1/QC.spliceJunctionAndExonCounts.forJunctionSeq.txt.gz", 
  "Controlrep2/QC.spliceJunctionAndExonCounts.forJunctionSeq.txt.gz",
  "Controlrep3/QC.spliceJunctionAndExonCounts.forJunctionSeq.txt.gz",
  "Controlrep4/QC.spliceJunctionAndExonCounts.forJunctionSeq.txt.gz",
  "Controlrep5/QC.spliceJunctionAndExonCounts.forJunctionSeq.txt.gz",
  "Controlrep6/QC.spliceJunctionAndExonCounts.forJunctionSeq.txt.gz"), 
  sample.names = c("1", "2", "3", "4", "5", "6"), 
  condition=factor(c("CTRL", "CTRL", "CTRL", "CASE", "CASE", "CASE")), 
  flat.gff.file = " Arabidopsis_thaliana.TAIR10.42.gff.gz", 
  nCores = 4, analysis.type = "junctionsAndExons");

writeSizeFactors(jscs, file = "sizeFactors.txt");

buildAllPlots(jscs=jscs, outfile.prefix = "WT_Treatment_effect_New_plots", use.plotting.device = "png", FDR.threshold = 0.01);

plotDispEsts(jscs);

plotMA(jscs, FDR.threshold=0.05);

writeCompleteResults(jscs, outfile.prefix="WT_Treatment_effect", gzip.output = TRUE, FDR.threshold = 0.01, save.allGenes = TRUE, save.sigGenes = TRUE, save.fit = FALSE, save.VST = FALSE, save.bedTracks = TRUE, save.jscs = FALSE, bedtrack.format = c("BED", "GTF", "GFF3"), verbose = TRUE)