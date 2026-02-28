# NUST Genomics: MSA Benchmark Analysis
## Task 3A - Comparing ClustalW & MAFFT for Multiple Sequence Alignment

---

## 📋 Project Overview

**Course:** Genomics (NUST)  
**Due Date:** March 4, 2026  
**Marks:** 10/100  
**Student:** Abid Hussain

### Objective
Benchmark two multiple sequence alignment (MSA) tools on primate mitochondrial DNA sequences to determine which performs better for genomic alignment tasks.

---

## 📊 Dataset

Three complete mitochondrial genomes:
| Organism | Accession | Length | Source |
|----------|-----------|--------|--------|
| Human | NC_012920.1 | 16,569 bp | NCBI |
| Chimpanzee | NC_001643.1 | 16,554 bp | NCBI |
| Gorilla | NC_011120.1 | 16,412 bp | NCBI |

---

## 🔧 Tools & Methods

### Tools Evaluated
1. **ClustalW** (v2.1) - Classic progressive MSA algorithm
2. **MAFFT** (v7) - Fast Fourier Transform-based MSA

### Note on MUSCLE
Originally planned to use MUSCLE (standard benchmark), but encountered segmentation faults on long sequences (>16kb). Switched to **MAFFT** which is equally robust and industry-standard for genomic alignment.

---

## 📈 Results

### Benchmark Summary
| Tool | Sequences | Alignment Length (bp) | Identity % | Mismatch % | Gap % | Exec Time (sec) |
|------|-----------|----------------------|------------|-----------|-------|-----------------|
| ClustalW | 3 | 17,149 | 79.22% | 13.54% | 7.24% | 46 |
| MAFFT | 3 | 17,153 | 79.19% | 13.52% | 7.29% | 1 |

### Key Findings
- **MAFFT is 46x faster** than ClustalW (1 sec vs 46 sec)
- **Quality is equivalent** - Both achieve ~79% identity on mitochondrial genomes
- **MAFFT is more efficient** - Slightly lower gap count (1,250 vs 1,242)
- **Percentages verified** - All composition metrics sum to exactly 100%

---

## 🚀 COMPLETE REPRODUCIBILITY GUIDE

### PART 1: Environment Setup

#### Step 1.1: Clone Repository
```bash
git clone https://github.com/yourusername/nust-genomics-msa-benchmark.git
cd nust-genomics-msa-benchmark
```

#### Step 1.2: Install Required Tools (Ubuntu/WSL)
```bash
sudo apt update
sudo apt install -y clustalw mafft

# Verify installations
clustalw -help | head -3
mafft --version
```

---

### PART 2: Download Sequences

#### Step 2.1: Download from NCBI (Automated)
```bash
cd inputs/

# Download Human mtDNA
wget -O human_mtdna.fasta \
  "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&id=NC_012920.1&rettype=fasta&retmode=text"

# Download Chimp mtDNA
wget -O chimp_mtdna.fasta \
  "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&id=NC_001643.1&rettype=fasta&retmode=text"

# Download Gorilla mtDNA
wget -O gorilla_mtdna.fasta \
  "https://eutils.ncbi.nlm.nih.gov/entrez/eutils/efetch.fcgi?db=nucleotide&id=NC_011120.1&rettype=fasta&retmode=text"

# Verify files
ls -lh *.fasta
```

#### Step 2.2: Combine Sequences
```bash
cat human_mtdna.fasta chimp_mtdna.fasta gorilla_mtdna.fasta > combined_mtdna.fasta

# Verify
head -2 combined_mtdna.fasta
```

---

### PART 3: Run Alignments

#### Step 3.1: Run ClustalW Alignment
```bash
cd ../scripts/
./01_clustalw_align.sh

# Verify output
ls -lh ../results/clustalw/
head -5 ../results/clustalw/alignment.aln
```

#### Step 3.2: Run MAFFT Alignment
```bash
./02_mafft_align.sh

# Verify output
ls -lh ../results/mafft/
head -5 ../results/mafft/alignment.aln
```

#### Step 3.3: Compare Execution Times
```bash
echo "ClustalW:" && cat ../results/clustalw/stats.txt
echo "MAFFT:" && cat ../results/mafft/stats.txt
```

---

### PART 4: Analyze Results (Google Colab)

#### Step 4.1: Prepare Files for Colab
```bash
cd ~/nust-genomics-msa-benchmark/results
# Files ready: clustalw/alignment.aln and mafft/alignment.aln
```

#### Step 4.2: Upload to Colab & Analyze
1. Go to https://colab.research.google.com
2. Create new notebook: `msa_benchmark_analysis`
3. Upload both alignment files:
   - `results/clustalw/alignment.aln`
   - `results/mafft/alignment.aln`
4. Run provided Python analysis scripts (see Colab notebook template)

#### Step 4.3: Generate Results
Python code will:
- Parse alignments using BioPython
- Calculate metrics: identity %, gaps, mismatches (summing to 100%)
- Create 4 comparison visualizations
- Save CSV and PNG files

#### Step 4.4: Move Results Back
```bash
cd ~/nust-genomics-msa-benchmark/results/comparison

# Move CSV (Windows path example)
mv /mnt/c/Users/admin/Downloads/comparison_table.csv .

# Move PNG
mv /mnt/c/Users/admin/Downloads/comparison_results.png figures/

# Verify
ls -lh && ls -lh figures/
```

---

### PART 5: Final Verification

#### Step 5.1: Verify Complete Structure
```bash
cd ~/nust-genomics-msa-benchmark
tree -L 2

# Expected:
# ├── inputs/ (4 FASTA files)
# ├── scripts/ (2 shell scripts)
# ├── results/
# │   ├── clustalw/ (alignment + tree + stats)
# │   ├── mafft/ (alignment + stats)
# │   └── comparison/ (CSV + PNG in figures/)
# ├── logs/ (2 log files)
# ├── README.md
# ├── requirements.txt
# └── .gitignore
```

#### Step 5.2: Verify Git Status
```bash
git status
# Should show: "On branch master" and "nothing to commit"

git log --oneline
# Should show commit history
```

---

## ✅ Verification Checklist

After running all steps, verify you have:
```
✅ inputs/
   ✅ human_mtdna.fasta (17K)
   ✅ chimp_mtdna.fasta (17K)
   ✅ gorilla_mtdna.fasta (17K)
   ✅ combined_mtdna.fasta (50K)

✅ scripts/
   ✅ 01_clustalw_align.sh
   ✅ 02_mafft_align.sh

✅ results/
   ✅ clustalw/
      ✅ alignment.aln (88K)
      ✅ alignment.dnd
      ✅ stats.txt
   ✅ mafft/
      ✅ alignment.aln (52K)
      ✅ stats.txt
   ✅ comparison/
      ✅ comparison_table.csv
      ✅ figures/
         ✅ comparison_results.png

✅ logs/
   ✅ clustalw.log
   ✅ mafft.log

✅ README.md
✅ requirements.txt
✅ .gitignore
```

---

## 🔧 Troubleshooting

### Issue: "clustalw: command not found"
```bash
sudo apt install -y clustalw
```

### Issue: FASTA files missing
```bash
# Use wget commands from PART 2 to download
```

### Issue: Alignment files are empty
```bash
cat logs/clustalw.log
cat logs/mafft.log
# Check for errors and re-run script
```

---

## 📝 How to Push to Git

Once you have successfully reproduced this analysis:

1. **All data is already committed** - The repository structure, scripts, and results are ready
2. **Just commit your work:**
```bash
   git add .
   git commit -m "Reproduce: Complete MSA benchmark analysis"
```
3. **Push to your remote (if set up):**
```bash
   git remote add origin <your-github-url>
   git push -u origin master
```

The reproducibility is the work - once you can run through this guide successfully, your repository is production-ready for GitHub!

---

## 📊 Expected Runtime

| Task | Time |
|------|------|
| Install tools | 2-3 min |
| Download sequences | 1-2 min |
| ClustalW alignment | 46 sec |
| MAFFT alignment | 1 sec |
| Colab analysis | 5-10 min |
| **Total** | **~15-20 min** |

---

## 📚 References

1. Thompson et al. (1994). CLUSTAL W. *Nucleic Acids Research* 22:4673-4680
2. Katoh & Standley (2013). MAFFT. *Molecular Biology and Evolution* 30:772-780
3. NCBI Nucleotide: https://www.ncbi.nlm.nih.gov/nucleotide/

---

## ✍️ Author
**Abid Hussain** | NUST Genomics | March 1, 2026
