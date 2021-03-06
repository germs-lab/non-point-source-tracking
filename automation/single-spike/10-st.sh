#for x in *rep*; do python epa-star-simulation/simulate-datasets/get-to-qiime-format.py $x $x > $x.renamed.fa; done

source1='*10000.0*renamed.fa'
source2='*9000.1000*renamed.fa'
sink='*9500.500*renamed.fa'
combo='source.0.source.10.sink.05.combined.fa'
python make-meta.py $combo $source1 $source2 $sink
mv $combo.meta $combo-qiime/metadata.txt
cd $combo-qiime
biom convert -i otu_table.biom -o otus.txt -b
R --vanilla --slave < example.r

cd /mnt/data1/lakelanier/16S-1

source1='*10000.0*renamed.fa'
source2='*9000.1000*renamed.fa'
sink='*9900.100*renamed.fa'
combo='source.0.source.10.sink.01.combined.fa'
python make-meta.py $combo $source1 $source2 $sink
mv $combo.meta $combo-qiime/metadata.txt
cd $combo-qiime
biom convert -i otu_table.biom -o otus.txt -b
R --vanilla --slave < example.r

cd /mnt/data1/lakelanier/16S-1

source1='*10000.0*renamed.fa'
source2='*9000.1000*renamed.fa'
sink='*9990.10*renamed.fa'
combo='source.0.source.10.sink.001.combined.fa'
python make-meta.py $combo $source1 $source2 $sink
mv $combo.meta $combo-qiime/metadata.txt
cd $combo-qiime
biom convert -i otu_table.biom -o otus.txt -b
R --vanilla --slave < example.r

cd /mnt/data1/lakelanier/16S-1
