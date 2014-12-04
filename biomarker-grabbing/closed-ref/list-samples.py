import sys

fp = open('cow-ids.txt', 'w'
)
for n, line in enumerate(open(sys.argv[1])):
    if n == 1:
        dat = line.rstrip().split('\t')
        for n, x in enumerate(dat):
            print n-1, x
            if 'cow' in x:
                fp.write('%s ' % str(n-1))
