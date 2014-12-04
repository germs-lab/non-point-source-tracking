sink='20.table.txt'
source1='30.table.txt'
source2='00.table.txt'

for x in $sink $source1 $source2; do biom convert -i $x -o ${x%.txt}.biom --table-type="OTU table"; done
merge_otu_tables.py -i ${sink%.txt}.biom,${source1%.txt}.biom,${source2%.txt}.biom  -o merged_otu_table.biom
rm ${sink%.txt}.biom ${source1%.txt}.biom ${source2%.txt}.biom
biom convert -i merged_otu_table.biom -o otus.txt -b
rm merged_otu_table.biom
R --vanilla --slave < example.r