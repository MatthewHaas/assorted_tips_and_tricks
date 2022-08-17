library(data.table)

# Set working directory
setwd("~/Documents/wild_rice")

# Read in data
nov21_read_count <- fread("nov21_fastq_read_count_every_other.txt")
july22_read_count <- fread("july22_fastq_read_count_every_other.txt")

# Assign column names
setnames(nov21_read_count, "num_reads")
setnames(july22_read_count, "num_reads")

# Order data by the number of reads in each sample
nov21_data[order(num_reads)]
july22_data[order(num_reads)]

# Remove sample name called "Analysis" (this was an artefact of the process of collecting filenames that I didn't catch before this step--has no effect on outcome)
nov21_data <- nov21_data[sample_name != "Analysis"]
july22_data <- july22_data[sample_name != "Analysis"]

# Make plots
pdf("Reneth_GBS_data_read_counts.pdf")
layout(matrix(c(1:2), ncol = 2))
nov21_read_count[, hist(num_reads/1e6, breaks = 100, xlab = "Number of reads per sample (in millions)", main = "November 2021 data", las = 1)]
july22_read_count[, hist(num_reads/1e6, breaks = 100, xlab = "Number of reads per sample (in millions)", main = "July 2022 data", las = 1)]
dev.off()
