import sys, os

#order for files is sink, source dirty, source clean

files = sys.argv[2:]

fp = open(sys.argv[1] + '.meta', "w")

fp.write("#SampleID\tDescription\tEnv\tSourceSink\tStudy\tDetails\n")
for i, file in enumerate(files):
    file = file.rstrip().split('.renamed.fa')[0]
    if i <= 4:
        fp.write('%s\tStream 1\tStream 1\tsource\tsimulation\t%s\n' % (file, file))
    elif i > 4 and i <= 9:
        fp.write('%s\tStream 2\tStream 2\tsource\tsimulation\t%s\n' % (file, file))
    elif i > 9 and i <= 14:
        fp.write('%s\tStream 3\tStream 3\tsource\tsimulation\t%s\n' % (file, file))
    else :
        fp.write('%s\tStream 4\tStream 4\tsink\tsimulation\t%s\n' % (file, file))
