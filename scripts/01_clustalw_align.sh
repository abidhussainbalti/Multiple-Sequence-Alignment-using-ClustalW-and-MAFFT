#!/bin/bash
echo "Running ClustalW on full mitochondrial genomes"
START_TIME=$(date +%s)
cd ../inputs
clustalw -INFILE=combined_mtdna.fasta -ALIGN -OUTPUT=CLUSTAL -OUTORDER=INPUT > ../logs/clustalw.log 2>&1
mv combined_mtdna.aln ../results/clustalw/alignment.aln 2>/dev/null
mv combined_mtdna.dnd ../results/clustalw/alignment.dnd 2>/dev/null
END_TIME=$(date +%s)
echo "ClustalW completed in $((END_TIME - START_TIME)) seconds"
echo "Execution time: $((END_TIME - START_TIME)) seconds" > ../results/clustalw/stats.txt
