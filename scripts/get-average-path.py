import sys, numpy

d_data = {}
files = sys.argv[1:]

for file in files:    
    d = {}

    for n, line in enumerate(open(file)):
        dat = line.rstrip().split('\t')
        if n == 0:
            d['path'] = []
        else:
            try: 
                val = float(dat[1])
            except:
                val = 0 
            d['path'].append(val)
    d_data[file] = d

for x in d_data:
    print x, d_data[x]['path'][0], d_data[x]['path'][1], d_data[x]['path'][2]
