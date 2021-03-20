#资产1,2
mddrmeanD12 = data.frame()
mddrmeanL12 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    mddrmean = mean(data[(data[,1] == i)&(data[,2]==j),][,9])
    mddrmeanL12 = c(mddrmeanL12,mddrmean)
    element = c(i,j,mddrmean)
    mddrmeanD12 = rbind(mddrmeanD12,element)
  }
}
colnames(mddrmeanD12) = c('X000001.SH','H11001.CSI','mddr mean')
#资产1,3
mddrmeanD13 = data.frame()
mddrmeanL13 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    mddrmean = mean(data[(data[,1] == i)&(data[,3]==j),][,9])
    mddrmeanL13 = c(mddrmeanL13,mddrmean)
    element = c(i,j,mddrmean)
    mddrmeanD13 = rbind(mddrmeanD13,element)
  }
}
colnames(mddrmeanD13) = c('X000001.SH','AU9999.SGE','mddr mean')
#资产1,4
mddrmeanD14 = data.frame()
mddrmeanL14 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    mddrmean = mean(data[(data[,1] == i)&(data[,4]==j),][,9])
    mddrmeanL14 = c(mddrmeanL14,mddrmean)
    element = c(i,j,mddrmean)
    mddrmeanD14 = rbind(mddrmeanD14,element)
  }
}
colnames(mddrmeanD14) = c('X000001.SH','SPX.GI','mddr mean')
#资产1,5
mddrmeanD15 = data.frame()
mddrmeanL15 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    mddrmean = mean(data[(data[,1] == i)&(data[,5]==j),][,9])
    mddrmeanL15 = c(mddrmeanL15,mddrmean)
    element = c(i,j,mddrmean)
    mddrmeanD15 = rbind(mddrmeanD15,element)
  }
}
colnames(mddrmeanD15) = c('X000001.SH','HSI.HI','mddr mean')
#资产2,3
mddrmeanD23 = data.frame()
mddrmeanL23 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    mddrmean = mean(data[(data[,2] == i)&(data[,3]==j),][,9])
    mddrmeanL23 = c(mddrmeanL23,mddrmean)
    element = c(i,j,mddrmean)
    mddrmeanD23 = rbind(mddrmeanD23,element)
  }
}
colnames(mddrmeanD23) = c('H11001.CSI','AU9999.SGE','mddr mean')
#资产2,4
mddrmeanD24 = data.frame()
mddrmeanL24 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    mddrmean = mean(data[(data[,2] == i)&(data[,4]==j),][,9])
    mddrmeanL24 = c(mddrmeanL24,mddrmean)
    element = c(i,j,mddrmean)
    mddrmeanD24 = rbind(mddrmeanD24,element)
  }
}
colnames(mddrmeanD24) = c('H11001.CSI','SPX.GI','mddr mean')
#资产2,5
mddrmeanD25 = data.frame()
mddrmeanL25 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    mddrmean = mean(data[(data[,2] == i)&(data[,5]==j),][,9])
    mddrmeanL25 = c(mddrmeanL25,mddrmean)
    element = c(i,j,mddrmean)
    mddrmeanD25 = rbind(mddrmeanD25,element)
  }
}
colnames(mddrmeanD25) = c('H11001.CSI','HSI.HI','mddr mean')
#资产3,4
mddrmeanD34 = data.frame()
mddrmeanL34 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    mddrmean = mean(data[(data[,3] == i)&(data[,4]==j),][,9])
    mddrmeanL34 = c(mddrmeanL34,mddrmean)
    element = c(i,j,mddrmean)
    mddrmeanD34 = rbind(mddrmeanD34,element)
  }
}
colnames(mddrmeanD34) = c('AU9999.SGE','SPX.GI','mddr mean')
#资产3,5
mddrmeanD35 = data.frame()
mddrmeanL35 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    mddrmean = mean(data[(data[,3] == i)&(data[,5]==j),][,9])
    mddrmeanL35 = c(mddrmeanL35,mddrmean)
    element = c(i,j,mddrmean)
    mddrmeanD35 = rbind(mddrmeanD35,element)
  }
}
colnames(mddrmeanD35) = c('AU9999.SGE','HSI.HI','mddr mean')
#资产4,5
mddrmeanD45 = data.frame()
mddrmeanL45 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    mddrmean = mean(data[(data[,4] == i)&(data[,5]==j),][,9])
    mddrmeanL45 = c(mddrmeanL45,mddrmean)
    element = c(i,j,mddrmean)
    mddrmeanD45 = rbind(mddrmeanD45,element)
  }
}
colnames(mddrmeanD45) = c('SPX.GI','HSI.HI','mddr mean')

levelplot(mddrmeanD12$`mddr mean`~mddrmeanD12$X000001.SH+mddrmeanD12$H11001.CSI)
levelplot(mddrmeanD13$`mddr mean`~mddrmeanD13$X000001.SH+mddrmeanD13$AU9999.SGE)
levelplot(mddrmeanD14$`mddr mean`~mddrmeanD14$X000001.SH+mddrmeanD14$SPX.GI)
levelplot(mddrmeanD15$`mddr mean`~mddrmeanD15$X000001.SH+mddrmeanD15$HSI.HI)
levelplot(mddrmeanD23$`mddr mean`~mddrmeanD23$H11001.CSI+mddrmeanD23$AU9999.SGE)
levelplot(mddrmeanD24$`mddr mean`~mddrmeanD24$H11001.CSI+mddrmeanD24$SPX.GI)
levelplot(mddrmeanD25$`mddr mean`~mddrmeanD25$H11001.CSI+mddrmeanD25$HSI.HI)
levelplot(mddrmeanD34$`mddr mean`~mddrmeanD34$AU9999.SGE+mddrmeanD34$SPX.GI)
levelplot(mddrmeanD35$`mddr mean`~mddrmeanD35$AU9999.SGE+mddrmeanD35$HSI.HI)
levelplot(mddrmeanD45$`mddr mean`~mddrmeanD45$SPX.GI+mddrmeanD45$HSI.HI)
