#资产1,2
avmeanD12 = data.frame()
avmeanL12 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    avmean = mean(data[(data[,1] == i)&(data[,2]==j),][,6])
    avmeanL12 = c(avmeanL12,avmean)
    element = c(i,j,avmean)
    avmeanD12 = rbind(avmeanD12,element)
  }
}
colnames(avmeanD12) = c('X000001.SH','H11001.CSI','av mean')
#资产1,3
avmeanD13 = data.frame()
avmeanL13 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    avmean = mean(data[(data[,1] == i)&(data[,3]==j),][,6])
    avmeanL13 = c(avmeanL13,avmean)
    element = c(i,j,avmean)
    avmeanD13 = rbind(avmeanD13,element)
  }
}
colnames(avmeanD13) = c('X000001.SH','AU9999.SGE','av mean')
#资产1,4
avmeanD14 = data.frame()
avmeanL14 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    avmean = mean(data[(data[,1] == i)&(data[,4]==j),][,6])
    avmeanL14 = c(avmeanL14,avmean)
    element = c(i,j,avmean)
    avmeanD14 = rbind(avmeanD14,element)
  }
}
colnames(avmeanD14) = c('X000001.SH','SPX.GI','av mean')
#资产1,5
avmeanD15 = data.frame()
avmeanL15 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    avmean = mean(data[(data[,1] == i)&(data[,5]==j),][,6])
    avmeanL15 = c(avmeanL15,avmean)
    element = c(i,j,avmean)
    avmeanD15 = rbind(avmeanD15,element)
  }
}
colnames(avmeanD15) = c('X000001.SH','HSI.HI','av mean')
#资产2,3
avmeanD23 = data.frame()
avmeanL23 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    avmean = mean(data[(data[,2] == i)&(data[,3]==j),][,6])
    avmeanL23 = c(avmeanL23,avmean)
    element = c(i,j,avmean)
    avmeanD23 = rbind(avmeanD23,element)
  }
}
colnames(avmeanD23) = c('H11001.CSI','AU9999.SGE','av mean')
#资产2,4
avmeanD24 = data.frame()
avmeanL24 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    avmean = mean(data[(data[,2] == i)&(data[,4]==j),][,6])
    avmeanL24 = c(avmeanL24,avmean)
    element = c(i,j,avmean)
    avmeanD24 = rbind(avmeanD24,element)
  }
}
colnames(avmeanD24) = c('H11001.CSI','SPX.GI','av mean')
#资产2,5
avmeanD25 = data.frame()
avmeanL25 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    avmean = mean(data[(data[,2] == i)&(data[,5]==j),][,6])
    avmeanL25 = c(avmeanL25,avmean)
    element = c(i,j,avmean)
    avmeanD25 = rbind(avmeanD25,element)
  }
}
colnames(avmeanD25) = c('H11001.CSI','HSI.HI','av mean')
#资产3,4
avmeanD34 = data.frame()
avmeanL34 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    avmean = mean(data[(data[,3] == i)&(data[,4]==j),][,6])
    avmeanL34 = c(avmeanL34,avmean)
    element = c(i,j,avmean)
    avmeanD34 = rbind(avmeanD34,element)
  }
}
colnames(avmeanD34) = c('AU9999.SGE','SPX.GI','av mean')
#资产3,5
avmeanD35 = data.frame()
avmeanL35 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    avmean = mean(data[(data[,3] == i)&(data[,5]==j),][,6])
    avmeanL35 = c(avmeanL35,avmean)
    element = c(i,j,avmean)
    avmeanD35 = rbind(avmeanD35,element)
  }
}
colnames(avmeanD35) = c('AU9999.SGE','HSI.HI','av mean')
#资产4,5
avmeanD45 = data.frame()
avmeanL45 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    avmean = mean(data[(data[,4] == i)&(data[,5]==j),][,6])
    avmeanL45 = c(avmeanL45,avmean)
    element = c(i,j,avmean)
    avmeanD45 = rbind(avmeanD45,element)
  }
}
colnames(avmeanD45) = c('SPX.GI','HSI.HI','av mean')

levelplot(avmeanD12$`av mean`~avmeanD12$X000001.SH+avmeanD12$H11001.CSI)
levelplot(avmeanD13$`av mean`~avmeanD13$X000001.SH+avmeanD13$AU9999.SGE)
levelplot(avmeanD14$`av mean`~avmeanD14$X000001.SH+avmeanD14$SPX.GI)
levelplot(avmeanD15$`av mean`~avmeanD15$X000001.SH+avmeanD15$HSI.HI)
levelplot(avmeanD23$`av mean`~avmeanD23$H11001.CSI+avmeanD23$AU9999.SGE)
levelplot(avmeanD24$`av mean`~avmeanD24$H11001.CSI+avmeanD24$SPX.GI)
levelplot(avmeanD25$`av mean`~avmeanD25$H11001.CSI+avmeanD25$HSI.HI)
levelplot(avmeanD34$`av mean`~avmeanD34$AU9999.SGE+avmeanD34$SPX.GI)
levelplot(avmeanD35$`av mean`~avmeanD35$AU9999.SGE+avmeanD35$HSI.HI)
levelplot(avmeanD45$`av mean`~avmeanD45$SPX.GI+avmeanD45$HSI.HI)

