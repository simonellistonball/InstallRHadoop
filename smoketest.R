
# Confirm everything is working with a quick smoketest in R:
library(rhdfs)
hdfs.init()
hdfs.ls('/')

# do some map-reduce
library(rmr2)

require('rmr2')
groups = rbinom(100, n = 500, prob = 0.5)
groups = to.dfs(groups)
result = mapreduce(input = groups, map = function(k,v) keyval(v, 1), reduce = function(k,vv) keyval(k,length(vv)))
print(result())
print(from.dfs(result))


# do some plyr work
library(plyrmr)

d<-matrix(c('A',1.0,1.0, 'B', 1.0, 2.0), nrow=2, ncol=3, byrow=TRUE)
to.dfs(d, output='/tmp/plyrin/', format=make.output.format('csv',sep=','))

test.csv.input.format = make.input.format(format='csv', mode='text', sep=',' ,col.names = c('Key','Value1', 'Value2'))
output(bind.cols(input('/tmp/plyrin/', test.csv.input.format), thing=Value1/Value2), '/tmp/plyrout')

# clean up
hdfs.delete('/tmp/plyrin')
hdfs.delete('/tmp/plyrout')
