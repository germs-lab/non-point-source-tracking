source1='*river.cow.8000.2000*renamed.fa'
source2='*river.river*renamed.fa'
source3='SRR401333.SRR401333.10000.0.*renamed.fa'
sink='*river.cow.9000.1000*renamed.fa'
combo='source.river.cow.20.sink.10.combined.fa'


python make-meta.py $combo $source1 $source2 $source3 $sink
mv $combo.meta $combo-qiime-denovo/otus/metadata.txt
cp example.r $combo-qiime-denovo/otus
cd $combo-qiime-denovo/otus
biom convert -i otu_table.biom -o otus.txt -b
R --vanilla --slave < example.r
cd /mnt/data1/lakelanier/16S-4

source1='*river.cow.8000.2000*renamed.fa'
source2='*river.river*renamed.fa'
source3='SRR401333.SRR401333.10000.0.*renamed.fa'
sink='*river.cow.9900.100*renamed.fa'
combo='source.river.cow.20.sink.1.combined.fa'


python make-meta.py $combo $source1 $source2 $source3 $sink
mv $combo.meta $combo-qiime-denovo/otus/metadata.txt
cp example.r $combo-qiime-denovo/otus
cd $combo-qiime-denovo/otus
biom convert -i otu_table.biom -o otus.txt -b
R --vanilla --slave < example.r
cd /mnt/data1/lakelanier/16S-4

