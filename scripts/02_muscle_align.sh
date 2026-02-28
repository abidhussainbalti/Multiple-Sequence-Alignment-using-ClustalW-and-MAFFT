#!/bin/bash
echo "Running MUSCLE on ND5 gene"
START_TIME=$(date +%s)
muscle3 -in ../inputs/combined_nd5.fasta -out ../results/muscle/alignment.aln > ../logs/muscle.log 2>&1
END_TIME=$(date +%s)
echo "MUSCLE completed in $((END_TIME - START_TIME)) seconds"
echo "Execution time: $((END_TIME - START_TIME)) seconds" > ../results/muscle/stats.txt
