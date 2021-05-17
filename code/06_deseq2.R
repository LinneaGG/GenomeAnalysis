directory <- "~/Skolgrejer/Genomanalys" 

sampleFiles <- c("htseq_out_1_continuous.txt","htseq_out_2_continuous.txt",
                 "htseq_out_3_batch.txt","htseq_out_4_batch.txt",
                 "htseq_out_5_continuous.txt","htseq_out_6_continuous.txt",
                 "htseq_out_7_continuous.txt","htseq_out_8_batch.txt","htseq_out_9_batch.txt",
                 "htseq_out_10_continuous.txt")
sampleCondition = c("continuous","continuous","batch","batch","continuous",
                    "continuous","continuous","batch","batch","continuous")

sampleTable <- data.frame(sampleName = sampleFiles,
                            fileName = sampleFiles,
                            condition = sampleCondition)

sampleTable$condition <- factor(sampleTable$condition)

library("DESeq2")
ddsHTSeq <- DESeqDataSetFromHTSeqCount(sampleTable = sampleTable,
                                       directory = directory,
                                       design= ~ condition) 


ddsHTSeq <- DESeq(ddsHTSeq)
resultsNames(ddsHTSeq)

res <- lfcShrink(ddsHTSeq, coef = "condition_continuous_vs_batch", type = "apeglm")

plotMA(res)
