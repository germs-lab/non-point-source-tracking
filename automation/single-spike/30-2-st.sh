source1='*10000.0*renamed.fa'
source2='*7000.3000*renamed.fa'
sink='*9900.100*renamed.fa'
combo='source.0.source.30.sink.01.combined.fa'

python make-meta.py $combo $source1 $source2 $sink
mv $combo.meta $combo-qiime/metadata.txt
cd $combo-qiime
biom convert -i otu_table.biom -o otus.txt -b
R --vanilla --slave < example.r
cd /mnt/data1/lakelanier/16S-1

source1='*10000.0*renamed.fa'
source2='*7000.3000*renamed.fa'
sink='*9990.10*renamed.fa'
combo='source.0.source.30.sink.001.combined.fa'

python make-meta.py $combo $source1 $source2 $sink
mv $combo.meta $combo-qiime/metadata.txt
cd $combo-qiime
biom convert -i otu_table.biom -o otus.txt -b
R --vanilla --slave < example.r

cd /mnt/data1/lakelanier/16S-1