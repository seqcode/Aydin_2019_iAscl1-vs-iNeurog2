args <- commandArgs(TRUE)

file=args[1]

data = read.table(file)

summary(data[,1])

#summary(data[,1:ncol(data)])
