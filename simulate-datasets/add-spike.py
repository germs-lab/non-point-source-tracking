import screed, sys, random

for record in screed.open(sys.argv[1]):
    name = "vulgatusspike"
    sequence = record.sequence

d = {}
for record in screed.open(sys.argv[2]):
    d[record.name] = record.sequence

spike_count = int(sys.argv[3])

random_select = random.sample(d.keys(), len(d.keys()) - spike_count)
for x in random_select:
    print ">" + x
    print d[x]

for i in range(0, spike_count):
    print ">" + name + "." + str(i)
    print sequence



    
