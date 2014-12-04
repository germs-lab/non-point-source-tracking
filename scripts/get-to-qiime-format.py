import screed, sys

prefix = sys.argv[2]
for n, record in enumerate(screed.open(sys.argv[1])):
    old_id = record.name
    new_id = prefix
    print '>' + prefix + '_' + str(n) + ' ' + old_id
    print record.sequence
