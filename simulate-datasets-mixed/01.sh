source1='*10000.0*renamed.fa'
source2='*9900.100*renamed.fa'
sink='*9990.10*renamed.fa'
combo='source.0.source.01.sink.001.combined.fa'

cat $source1 $source2 $sink > $combo
pick_closed_reference_otus.py -o $combo-qiime -i $combo -r /mnt/data1/lakelanier/16S-data/gg_13_8_otus/rep_set/97_otus.fasta -p param.txt -f
