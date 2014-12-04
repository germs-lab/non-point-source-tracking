import sys, glob

l = []
for line in open("important_otus.txt"):
    dat = line.rstrip().split('\t')
    l.append(dat[0])

d = {}
f = glob.glob("uclust_ref_picked_otus/*otus.txt")
for line in open(f[0]):
    dat = line.rstrip().split("\t")
    d[dat[0]] = dat[1:]

for x in l:
    for y in d[x]:
        print x, y
