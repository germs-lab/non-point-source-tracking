import screed, sys

d = {}
for record in screed.open("/mnt/data1/lakelanier/16S-4/all-combined.fa"):
    d[record.name] = [record.description, record.sequence]

for line in open("ids.txt"):
    dat = line.rstrip().split(' ')
    id = dat[0]
    descr2 = d[dat[1]][0]
    sequence = d[dat[1]][1]
    print ">" + id + '_' + dat[1] + '_' + descr2
    print sequence
