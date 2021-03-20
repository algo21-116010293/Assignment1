#资产1,2
srmeanD12 = data.frame()
srmeanL12 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    srmean = mean(data[(data[,1] == i)&(data[,2]==j),][,8])
    srmeanL12 = c(srmeanL12,srmean)
    element = c(i,j,srmean)
    srmeanD12 = rbind(srmeanD12,element)
  }
}
colnames(srmeanD12) = c('X000001.SH','H11001.CSI','sharp ratio')
#资产1,3
srmeanD13 = data.frame()
srmeanL13 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    srmean = mean(data[(data[,1] == i)&(data[,3]==j),][,8])
    srmeanL13 = c(srmeanL13,srmean)
    element = c(i,j,srmean)
    srmeanD13 = rbind(srmeanD13,element)
  }
}
colnames(srmeanD13) = c('X000001.SH','AU9999.SGE','sharp ratio')
#资产1,4
srmeanD14 = data.frame()
srmeanL14 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    srmean = mean(data[(data[,1] == i)&(data[,4]==j),][,8])
    srmeanL14 = c(srmeanL14,srmean)
    element = c(i,j,srmean)
    srmeanD14 = rbind(srmeanD14,element)
  }
}
colnames(srmeanD14) = c('X000001.SH','SPX.GI','sharp ratio')
#资产1,5
srmeanD15 = data.frame()
srmeanL15 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    srmean = mean(data[(data[,1] == i)&(data[,5]==j),][,8])
    srmeanL15 = c(srmeanL15,srmean)
    element = c(i,j,srmean)
    srmeanD15 = rbind(srmeanD15,element)
  }
}
colnames(srmeanD15) = c('X000001.SH','HSI.HI','sharp ratio')
#资产2,3
srmeanD23 = data.frame()
srmeanL23 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    srmean = mean(data[(data[,2] == i)&(data[,3]==j),][,8])
    srmeanL23 = c(srmeanL23,srmean)
    element = c(i,j,srmean)
    srmeanD23 = rbind(srmeanD23,element)
  }
}
colnames(srmeanD23) = c('H11001.CSI','AU9999.SGE','sharp ratio')
#资产2,4
srmeanD24 = data.frame()
srmeanL24 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    srmean = mean(data[(data[,2] == i)&(data[,4]==j),][,8])
    srmeanL24 = c(srmeanL24,srmean)
    element = c(i,j,srmean)
    srmeanD24 = rbind(srmeanD24,element)
  }
}
colnames(srmeanD24) = c('H11001.CSI','SPX.GI','sharp ratio')
#资产2,5
srmeanD25 = data.frame()
srmeanL25 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    srmean = mean(data[(data[,2] == i)&(data[,5]==j),][,8])
    srmeanL25 = c(srmeanL25,srmean)
    element = c(i,j,srmean)
    srmeanD25 = rbind(srmeanD25,element)
  }
}
colnames(srmeanD25) = c('H11001.CSI','HSI.HI','sharp ratio')
#资产3,4
srmeanD34 = data.frame()
srmeanL34 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    srmean = mean(data[(data[,3] == i)&(data[,4]==j),][,8])
    srmeanL34 = c(srmeanL34,srmean)
    element = c(i,j,srmean)
    srmeanD34 = rbind(srmeanD34,element)
  }
}
colnames(srmeanD34) = c('AU9999.SGE','SPX.GI','sharp ratio')
#资产3,5
srmeanD35 = data.frame()
srmeanL35 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    srmean = mean(data[(data[,3] == i)&(data[,5]==j),][,8])
    srmeanL35 = c(srmeanL35,srmean)
    element = c(i,j,srmean)
    srmeanD35 = rbind(srmeanD35,element)
  }
}
colnames(srmeanD35) = c('AU9999.SGE','HSI.HI','sharp ratio')
#资产4,5
srmeanD45 = data.frame()
srmeanL45 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    srmean = mean(data[(data[,4] == i)&(data[,5]==j),][,8])
    srmeanL45 = c(srmeanL45,srmean)
    element = c(i,j,srmean)
    srmeanD45 = rbind(srmeanD45,element)
  }
}
colnames(srmeanD45) = c('SPX.GI','HSI.HI','sharp ratio')

levelplot(srmeanD12$`sharp ratio`~srmeanD12$X000001.SH+srmeanD12$H11001.CSI)
levelplot(srmeanD13$`sharp ratio`~srmeanD13$X000001.SH+srmeanD13$AU9999.SGE)
levelplot(srmeanD14$`sharp ratio`~srmeanD14$X000001.SH+srmeanD14$SPX.GI)
levelplot(srmeanD15$`sharp ratio`~srmeanD15$X000001.SH+srmeanD15$HSI.HI)
levelplot(srmeanD23$`sharp ratio`~srmeanD23$H11001.CSI+srmeanD23$AU9999.SGE)
levelplot(srmeanD24$`sharp ratio`~srmeanD24$H11001.CSI+srmeanD24$SPX.GI)
levelplot(srmeanD25$`sharp ratio`~srmeanD25$H11001.CSI+srmeanD25$HSI.HI)
levelplot(srmeanD34$`sharp ratio`~srmeanD34$AU9999.SGE+srmeanD34$SPX.GI)
levelplot(srmeanD35$`sharp ratio`~srmeanD35$AU9999.SGE+srmeanD35$HSI.HI)
levelplot(srmeanD45$`sharp ratio`~srmeanD45$SPX.GI+srmeanD45$HSI.HI)
