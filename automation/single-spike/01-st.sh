source1='*10000.0*renamed.fa'
source2='*9900.100*renamed.fa'
sink='*9990.10*renamed.fa'
combo='source.0.source.01.sink.001.combined.fa'

python make-meta.py $combo $source1 $source2 $sink
mv $combo.meta $combo-qiime/metadata.txt
cd $combo-qiime
biom convert -i otu_table.biom -o otus.txt -b
R --vanilla --slave < example.r

