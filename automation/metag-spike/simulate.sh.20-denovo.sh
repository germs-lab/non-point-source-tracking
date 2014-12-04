source1='*river.cow.8000.2000*renamed.fa'
source2='*river.river*renamed.fa'
source3='SRR401333.SRR401333.10000.0.*renamed.fa'
sink='*river.cow.9000.1000*renamed.fa'
combo='source.river.cow.20.sink.10.combined.fa'

cat $source1 $source2 $source3 $sink > $combo
pick_de_novo_otus.py -i $combo -o $combo-qiime-denovo/otus/ -p param.txt -f

source1='*river.cow.8000.2000*renamed.fa'
source2='*river.river*renamed.fa'
source3='SRR401333.SRR401333.10000.0.*renamed.fa'
sink='*river.cow.9900.100*renamed.fa'
combo='source.river.cow.20.sink.1.combined.fa'

cat $source1 $source2 $source3 $sink > $combo
pick_closed_reference_otus.py -o $combo-qiime -i $combo -r /mnt/data1/lakelanier/16S-data/gg_13_8_otus/rep_set/97_otus.fasta -p param.txt -f

bash source.sh.20-denovo.sh