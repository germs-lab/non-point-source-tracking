import sys

#order for files is sink, source dirty, source clean

files = [sys.argv[1], sys.argv[2], sys.argv[3]]

fp = open("metadata.txt", "w")

fp.write("#SampleID\tDescription\tEnv\tSourceSink\tStudy\tDetails\n")
for i, file in enumerate(files):
    for n, line in enumerate(open(file)):
        if n == 1:
            if i == 0:
                for each in line.rstrip().split('\t')[1:]:
                    fp.write('%s\tStream 3\thigh N water\tsink\tsimulation\t%s\n' % (each, each))
            elif i == 1:
                for each in line.rstrip().split('\t')[1:]:
                    fp.write('%s\tStream 2\thigh N water\tsource\tsimulation\t%s\n' % (each, each))
            else:
                for each in line.rstrip().split('\t')[1:]:
                    fp.write('%s\tStream 1\tlow N water\tsource\tsimulation\t%s\n' % (each, each))
