import sys, numpy

d_data = {}
files = sys.argv[1:]

for file in files:    
    d = {}

    for n, line in enumerate(open(file)):
        dat = line.rstrip().split('\t')
        if n == 0:
            header = dat
            for x in header:
                d[x] = []
        else:
            a1, b1, c1, d1 = float(dat[1]), float(dat[2]), float(dat[3]), float(dat[4])
            d[header[0]].append(a1)
            d[header[1]].append(b1)
            d[header[2]].append(c1)
            d[header[3]].append(d1)
    
            
    d_data[file] = d

print d
for x in d_data:
    print x, numpy.average(d_data[x][header[0]]), numpy.average(d_data[x][header[1]]), numpy.average(d_data[x][header[2]]), numpy.average(d_data[x][header[3]])
