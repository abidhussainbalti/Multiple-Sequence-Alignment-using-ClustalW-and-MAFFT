#!/bin/bash
echo "Running MAFFT on full mitochondrial genomes"
START_TIME=$(date +%s)
mafft --auto ../inputs/combined_mtdna.fasta > ../results/mafft/alignment.aln 2> ../logs/mafft.log
END_TIME=$(date +%s)
echo "MAFFT completed in $((END_TIME - START_TIME)) seconds"
echo "Execution time: $((END_TIME - START_TIME)) seconds" > ../results/mafft/stats.txt
