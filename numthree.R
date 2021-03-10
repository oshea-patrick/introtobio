library(ggplot2)
library(patchwork)
library(ShortRead)
library(Biostrings)

dna1 <- readFastq('/projectnb2/ct-shbioinf/bio331/exam1/SRR5808948.fastq')
dna2 <- readFastq('/projectnb2/ct-shbioinf/bio331/exam1/SRR5808950.fastq')
dna3 <- readFastq('/projectnb2/ct-shbioinf/bio331/exam1/SRR5808951.fastq')

qual1 = quality(dna1)
qual2 = quality(dna2)
qual3 = quality(dna3)

n1 = as(qual1[1:7000000], "matrix")
n2 = as(qual2[1:7000000], "matrix")
n3 = as(qual3[1:7000000], "matrix")

SRR5808948_Quality_Score = rowMeans(n1, na.rm = T)
SRR5808948_Quality_Score = as.data.frame(SRR5808948_Quality_Score)

x = ggplot(SRR5808948_Quality_Score) + 
  geom_histogram(aes(x=SRR5808948_Quality_Score))

SRR5808951_Quality_Score = rowMeans(n2, na.rm = T)
SRR5808951_Quality_Score = as.data.frame(SRR5808951_Quality_Score)

y = ggplot(SRR5808951_Quality_Score) + 
  geom_histogram(aes(x=SRR5808951_Quality_Score))

SRR5808950_Quality_Score = rowMeans(n3, na.rm = T)
SRR5808950_Quality_Score = as.data.frame(SRR5808950_Quality_Score)

z = ggplot(SRR5808950_Quality_Score) + 
  geom_histogram(aes(x=SRR5808950_Quality_Score))

x+y+z
