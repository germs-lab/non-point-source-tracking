# This runs SourceTracker on the original "contamination" data set
# (data included in 'data' folder)

library(plyr)
# load sample metadata
metadata <- read.table('metadata.txt',sep='\t',h=T,row.names=1,check=F,comment='')

# load OTU table
# This 'read.table' command is designed for a 
# QIIME-formatted OTU table.
# namely, the first line begins with a '#' sign
# and actually _is_ a comment; the second line
# begins with a '#' sign but is actually the header
otus <- read.table('otus.txt',sep='\t', header=T,row.names=1,check=F,skip=1,comment='')
otus <- t(as.matrix(otus))

# extract only those samples in common between the two tables
common.sample.ids <- intersect(rownames(metadata), rownames(otus))
otus <- otus[common.sample.ids,]
metadata <- metadata[common.sample.ids,]
# double-check that the mapping file and otu table
# had overlapping samples
if(length(common.sample.ids) <= 1) {
    message <- paste(sprintf('Error: there are %d sample ids in common '),
                    'between the metadata file and data table')
    stop(message)
}

# extract the source environments and source/sink indices
train.ix <- which(metadata$SourceSink=='source')
test.ix <- which(metadata$SourceSink=='sink')
envs <- metadata$Env
if(is.element('Description',colnames(metadata))) desc <- metadata$Description


# load SourceTracker package
source('/mnt/data1/lakelanier/sourcetracker-0.9.6/src/SourceTracker.r')

# tune the alpha values using cross-validation (this is slow!)
#tune.results <- tune.st(otus[train.ix,], envs[train.ix])
#alpha1 <- tune.results$best.alpha1
#alpha2 <- tune.results$best.alpha2
# note: to skip tuning, run this instead:
alpha1 <- 0.001
alpha2 <- 0.001

# train SourceTracker object on training data
st <- sourcetracker(otus[train.ix,], envs[train.ix])

# Estimate source proportions in test data
results <- predict(st,otus[test.ix,], alpha1=alpha1, alpha2=alpha2, full.results=TRUE)

save(results,file="results.Rda")
write.table(results$proportions, file="results.proportions.txt",quote=FALSE,sep='\t')
write.table(results$proportions_sd, file="results.proportions_sd.txt",quote=FALSE,sep='\t')

index_path = which(names(as.data.frame(otus))=="9999999999999")

otu.env.probs1 <- t(apply(results$full.results[,,,1],c(2,3),mean))
otu.env.probs1 <- sweep(otu.env.probs1,1,rowSums(otu.env.probs1),'/')
otu.env.probs2 <- t(apply(results$full.results[,,,2],c(2,3),mean))
otu.env.probs2 <- sweep(otu.env.probs2,1,rowSums(otu.env.probs2),'/')
otu.env.probs3 <- t(apply(results$full.results[,,,3],c(2,3),mean))
otu.env.probs3 <- sweep(otu.env.probs3,1,rowSums(otu.env.probs3),'/')
otu.env.probs4 <- t(apply(results$full.results[,,,4],c(2,3),mean))
otu.env.probs4 <- sweep(otu.env.probs4,1,rowSums(otu.env.probs4),'/')
otu.env.probs5 <- t(apply(results$full.results[,,,5],c(2,3),mean))
otu.env.probs5 <- sweep(otu.env.probs5,1,rowSums(otu.env.probs5),'/')

otu.env.probs1 <- as.data.frame(otu.env.probs1)
otu.env.probs2 <- as.data.frame(otu.env.probs2)
otu.env.probs3 <- as.data.frame(otu.env.probs3)
otu.env.probs4 <- as.data.frame(otu.env.probs4)
otu.env.probs5 <- as.data.frame(otu.env.probs5)

all.dat <- list(otu.env.probs1, otu.env.probs2, otu.env.probs3, otu.env.probs4, otu.env.probs5)
ans1 = aaply(laply(all.dat, as.matrix), c(2, 3), mean)
write.table(ans1, file="otu.proportions.txt",quote=FALSE,sep='\t')

path_prob <- ans1[index_path,]
write.table(path_prob, file="path.proportions.txt",quote=FALSE,sep='\t')
# Estimate leave-one-out source proportions in training data 
#results.train <- predict(st, alpha1=alpha1, alpha2=alpha2)

# plot results
#labels <- sprintf('%s %s', envs,desc)
#plot(results, labels[test.ix], type='pie')

# other plotting functions
# plot(results, labels[test.ix], type='bar')
# plot(results, labels[test.ix], type='dist')
# plot(results.train, labels[train.ix], type='pie')
# plot(results.train, labels[train.ix], type='bar')
# plot(results.train, labels[train.ix], type='dist')

# plot results with legend
# plot(results, labels[test.ix], type='pie', include.legend=TRUE, env.colors=c('#47697E','#5B7444','#CC6666','#79BEDB','#885588'))