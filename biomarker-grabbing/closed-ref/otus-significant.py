import sys


cutoff1 = 0.30
cutoff2 = 0.05
d_data = {}
for line in open(sys.argv[1]):
    dat = line.rstrip().split('\t')
    try:
        float(dat[1])
        float(dat[2])
    except:
        continue
    if float(dat[1]) > cutoff1 and float(dat[2]) < cutoff2:
        d_data[dat[0]] = dat[1:]

d_otus = {}
for n, line in enumerate(open("otus.txt")):
    if n > 1:
        n_corrected = n - 1
        d_otus[n_corrected] = line.rstrip().split('\t')


d = {}
for line in open("/mnt/data1/lakelanier/16S-data/gg_13_8_otus/taxonomy/97_otu_taxonomy.txt"):
    dat = line.rstrip().split('\t')
    d[dat[0]] = dat[1].split(';')

fp = open("important_otus.txt", 'w')

for line in open("cow-ids.txt"):
    good_indexes = line.rstrip().split(' ')

for x in d_data.keys():
    x = int(x)
    n_in_gg = str(d_otus[x][0])
    taxon = d[n_in_gg]
    l_abundances = []
    for i in good_indexes:
        i = int(i)
        l_abundances.append(d_otus[x][i+1])
    fp.write('%s\t%s\t%s\n' % (n_in_gg, ';'.join(taxon), ';'.join(l_abundances)))
