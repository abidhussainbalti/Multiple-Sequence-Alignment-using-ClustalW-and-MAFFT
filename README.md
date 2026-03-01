# NUST Genomics: MSA Benchmark Analysis
## Task 3A - Comparing ClustalW & MAFFT for Multiple Sequence Alignment

---

## 📋 Project Overview

**Course:** Genomics (NUST) | **Due:** March 4, 2026 | **Student:** Abid Hussain

**Objective:** Benchmark two multiple sequence alignment (MSA) tools on primate mitochondrial DNA to compare speed and accuracy.

---

## 📁 Repository Structure
```
nust-genomics-msa-benchmark/
├── README.md & METHODOLOGY.md
├── requirements.txt & .gitignore
├── inputs/ (4 FASTA files - mtDNA sequences)
├── scripts/ (2 alignment scripts - ClustalW & MAFFT)
├── results/
│   ├── clustalw/ (alignment output + stats)
│   ├── mafft/ (alignment output + stats)
│   └── comparison/ (CSV + PNG visualizations)
├── logs/ (execution logs)
└── colab/ (Jupyter analysis notebook)
```

---

## 📊 Dataset

**Mitochondrial DNA from 3 Primate Species:**

| Organism | Length | Source |
|----------|--------|--------|
| Human | 16,569 bp | NC_012920.1 |
| Chimpanzee | 16,554 bp | NC_001643.1 |
| Gorilla | 16,412 bp | NC_011120.1 |

---

## 🔧 Tools Compared

| Tool | Algorithm | Speed | Year | Method |
|------|-----------|-------|------|--------|
| **ClustalW** | Progressive | O(n³) | 1994 | Guide tree → Progressive alignment |
| **MAFFT** | FFT-based | O(n log n) | 2002 | FFT distance → UPGMA → Refinement |

**For detailed explanation:** See `METHODOLOGY.md`

---

## 📈 Results Summary

| Metric | ClustalW | MAFFT | Winner |
|--------|----------|-------|--------|
| **Time** | 46 sec | 1 sec | MAFFT (46x faster) |
| **Identity** | 79.22% | 79.19% | Equivalent |
| **Quality** | Good | Excellent | MAFFT |

### Key Finding
✅ **MAFFT is 46x faster with equivalent accuracy**

---

## 🚀 Quick Start
```bash
# Install tools
sudo apt install -y clustalw mafft

# Run alignments
cd nust-genomics-msa-benchmark
bash scripts/01_clustalw_align.sh
bash scripts/02_mafft_align.sh

# View results
cat results/comparison/comparison_table.csv
```

**Runtime:** ~50 seconds

---

## 📊 Analysis Results

**ClustalW:**
- Alignment: 17,149 bp | Identity: 79.22% | Time: 46 sec

**MAFFT:**
- Alignment: 17,153 bp | Identity: 79.19% | Time: 1 sec

**Conclusion:** MAFFT superior for genomic-scale alignments

---

## 📈 Visualizations

**File:** `results/comparison/figures/comparison_results.png`
- Panel 1: Identity comparison
- Panel 2: Speed comparison (46x difference)
- Panel 3: Alignment statistics
- Panel 4: Summary table

**CSV:** `results/comparison/comparison_table.csv`

---

## 📚 References

1. Thompson et al. (1994). CLUSTAL W. *Nucleic Acids Research* 22:4673-4680
2. Katoh & Standley (2013). MAFFT. *Molecular Biology and Evolution* 30:772-780

---

For detailed methodology, see **METHODOLOGY.md** 

**Author:** Abid Hussain | NUST Genomics | March 1, 2026
