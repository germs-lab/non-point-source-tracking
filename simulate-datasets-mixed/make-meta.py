import sys, os

#order for files is sink, source dirty, source clean

files = sys.argv[2:]

fp = open(sys.argv[1] + '.meta', "w")

fp.write("#SampleID\tDescription\tEnv\tSourceSink\tStudy\tDetails\n")
for i, file in enumerate(files):
    file = file.rstrip().split('.renamed.fa')[0]
    print i, file
    if i <= 4:
        fp.write('%s\tStream 3\thigh N water\tsource\tsimulation\t%s\n' % (file, file))
    elif i > 4 and i <= 9:
        fp.write('%s\tStream 2\tlow N water\tsource\tsimulation\t%s\n' % (file, file))
    else:
        fp.write('%s\tStream 1\thigh N water\tsink\tsimulation\t%s\n' % (file, file))

