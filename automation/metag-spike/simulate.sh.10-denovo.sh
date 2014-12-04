source1='*river.cow.9000.1000*renamed.fa'
source2='*river.river*renamed.fa'
source3='SRR401333.SRR401333.10000.0.*renamed.fa'
sink='*river.cow.9900.100*renamed.fa'
combo='source.river.cow.10.sink.1.combined.fa'

cat $source1 $source2 $source3 $sink > $combo
pick_de_novo_otus.py -i $combo -o $combo-qiime-denovo/otus/ -p param.txt -f

bash source.sh.10-denovo.sh