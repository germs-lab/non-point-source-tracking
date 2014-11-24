import screed, sys, random

def store_sequences(file):
    d = {}
    for record in screed.open(file):
        name = record.name
        sequence = record.sequence
        d[name] = sequence
    return d

def random_select(d, number):
    d2 = {}
    random_set = random.sample(d.keys(), number)
    for x in random_set:
        d2[x] = d[x]
    return d2

if __name__ == "__main__":
    number_of_reads = int(sys.argv[3])
    number_of_spike = int(float(sys.argv[4])/100*number_of_reads)
    number_of_nonspike = number_of_reads - number_of_spike
    rep_number = int(sys.argv[5])
    nonspike = store_sequences(sys.argv[1])
    spike = store_sequences(sys.argv[2])
    for x in range(0, rep_number):
        id = sys.argv[1].split('.')[0] + '.' + sys.argv[2].split('.')[0] + '.' + str(number_of_nonspike)+'.' + str(number_of_spike) + '.rep' + str(x)
        fp = open(id, 'w')
        nonspike_sample = random_select(nonspike, number_of_nonspike)
        for n, key in enumerate(nonspike_sample):
            fp.write(">%s.%s %s\n" % (sys.argv[1].split('.')[0], str(n), key))
            fp.write("%s\n" % nonspike_sample[key])
        for i in range(0, number_of_spike):
            fp.write(">%s.%s %s\n" % (sys.argv[2].split('.')[0], str(i), spike.keys()[0]))
            fp.write("%s\n" % spike.values()[0])
        fp.close()


    
