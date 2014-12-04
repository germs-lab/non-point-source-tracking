python epa-star-simulation/simulate-datasets-mixed/add-spiked-single.py SRR401333.fastq.trimmed vulgatus.16S.fa 10000 30
python epa-star-simulation/simulate-datasets-mixed/add-spiked-single.py SRR401333.fastq.trimmed vulgatus.16S.fa 10000 20
python epa-star-simulation/simulate-datasets-mixed/add-spiked-single.py SRR401333.fastq.trimmed vulgatus.16S.fa 10000 10
python epa-star-simulation/simulate-datasets-mixed/add-spiked-single.py SRR401333.fastq.trimmed vulgatus.16S.fa 10000 5
python epa-star-simulation/simulate-datasets-mixed/add-spiked-single.py SRR401333.fastq.trimmed vulgatus.16S.fa 10000 1
python epa-star-simulation/simulate-datasets-mixed/add-spiked-single.py SRR401333.fastq.trimmed vulgatus.16S.fa 10000 .01
python epa-star-simulation/simulate-datasets-mixed/add-spiked-single.py SRR401333.fastq.trimmed vulgatus.16S.fa 10000 0
mv $combo.meta $combo-qiime/metadata.txt
cd $combo-qiime
biom convert -i otu_table.biom -o otus.txt -b
R --vanilla --slave < example.R
