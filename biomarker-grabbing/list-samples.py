import sys

for n, line in enumerate(open(sys.argv[1])):
    if n == 1:
        dat = line.rstrip().split('\t')
        for n, x in enumerate(dat):
            print n-1, x
