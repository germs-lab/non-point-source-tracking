#for x in *rep*; do python epa-star-simulation/simulate-datasets/get-to-qiime-format.py $x $x > $x.renamed.fa; done

source1='*10000.0*renamed.fa'
source2='*7000.3000*renamed.fa'
sink='*8000.2000*renamed.fa'
combo='source.0.source.30.sink.20.combined.fa'

cat $source1 $source2 $sink > $combo
pick_closed_reference_otus.py -o $combo-qiime -i $combo -r /mnt/data1/lakelanier/16S-data/gg_13_8_otus/rep_set/97_otus.fasta -p param.txt

source1='*10000.0*renamed.fa'
source2='*7000.3000*renamed.fa'
sink='*9000.1000*renamed.fa'
combo='source.0.source.30.sink.10.combined.fa'

cat $source1 $source2 $sink > $combo
pick_closed_reference_otus.py -o $combo-qiime -i $combo -r /mnt/data1/lakelanier/16S-data/gg_13_8_otus/rep_set/97_otus.fasta -p param.txt

source1='*10000.0*renamed.fa'
source2='*7000.3000*renamed.fa'
sink='*9500.500*renamed.fa'
combo='source.0.source.30.sink.05.combined.fa'

cat $source1 $source2 $sink > $combo
pick_closed_reference_otus.py -o $combo-qiime -i $combo -r /mnt/data1/lakelanier/16S-data/gg_13_8_otus/rep_set/97_otus.fasta -p param.txt

source1='*10000.0*renamed.fa'
source2='*7000.3000*renamed.fa'
sink='*9900.100*renamed.fa'
combo='source.0.source.30.sink.01.combined.fa'

cat $source1 $source2 $sink > $combo
pick_closed_reference_otus.py -o $combo-qiime -i $combo -r /mnt/data1/lakelanier/16S-data/gg_13_8_otus/rep_set/97_otus.fasta -p param.txt

source1='*10000.0*renamed.fa'
source2='*7000.3000*renamed.fa'
sink='*9990.10*renamed.fa'
combo='source.0.source.30.sink.001.combined.fa'