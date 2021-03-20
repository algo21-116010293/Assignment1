#资产1,2
armeanD12 = data.frame()
armeanL12 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    armean = mean(data[(data[,1] == i)&(data[,2]==j),][,7])
    armeanL12 = c(armeanL12,armean)
    element = c(i,j,armean)
    armeanD12 = rbind(armeanD12,element)
  }
}
colnames(armeanD12) = c('X000001.SH','H11001.CSI','ar mean')
#资产1,3
armeanD13 = data.frame()
armeanL13 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    armean = mean(data[(data[,1] == i)&(data[,3]==j),][,7])
    armeanL13 = c(armeanL13,avmean)
    element = c(i,j,armean)
    armeanD13 = rbind(armeanD13,element)
  }
}
colnames(armeanD13) = c('X000001.SH','AU9999.SGE','ar mean')
#资产1,4
armeanD14 = data.frame()
armeanL14 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    armean = mean(data[(data[,1] == i)&(data[,4]==j),][,7])
    armeanL14 = c(armeanL14,armean)
    element = c(i,j,armean)
    armeanD14 = rbind(armeanD14,element)
  }
}
colnames(armeanD14) = c('X000001.SH','SPX.GI','ar mean')
#资产1,5
armeanD15 = data.frame()
armeanL15 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    armean = mean(data[(data[,1] == i)&(data[,5]==j),][,7])
    armeanL15 = c(armeanL15,armean)
    element = c(i,j,armean)
    armeanD15 = rbind(armeanD15,element)
  }
}
colnames(armeanD15) = c('X000001.SH','HSI.HI','ar mean')
#资产2,3
armeanD23 = data.frame()
armeanL23 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    armean = mean(data[(data[,2] == i)&(data[,3]==j),][,7])
    armeanL23 = c(armeanL23,armean)
    element = c(i,j,armean)
    armeanD23 = rbind(armeanD23,element)
  }
}
colnames(armeanD23) = c('H11001.CSI','AU9999.SGE','ar mean')
#资产2,4
armeanD24 = data.frame()
armeanL24 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    armean = mean(data[(data[,2] == i)&(data[,4]==j),][,7])
    armeanL24 = c(armeanL24,armean)
    element = c(i,j,armean)
    armeanD24 = rbind(armeanD24,element)
  }
}
colnames(armeanD24) = c('H11001.CSI','SPX.GI','ar mean')
#资产2,5
armeanD25 = data.frame()
armeanL25 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    armean = mean(data[(data[,2] == i)&(data[,5]==j),][,7])
    armeanL25 = c(armeanL25,armean)
    element = c(i,j,armean)
    armeanD25 = rbind(armeanD25,element)
  }
}
colnames(armeanD25) = c('H11001.CSI','HSI.HI','ar mean')
#资产3,4
armeanD34 = data.frame()
armeanL34 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    armean = mean(data[(data[,3] == i)&(data[,4]==j),][,7])
    armeanL34 = c(armeanL34,avmean)
    element = c(i,j,armean)
    armeanD34 = rbind(armeanD34,element)
  }
}
colnames(armeanD34) = c('AU9999.SGE','SPX.GI','ar mean')
#资产3,5
armeanD35 = data.frame()
armeanL35 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    armean = mean(data[(data[,3] == i)&(data[,5]==j),][,7])
    armeanL35 = c(armeanL35,armean)
    element = c(i,j,armean)
    armeanD35 = rbind(armeanD35,element)
  }
}
colnames(armeanD35) = c('AU9999.SGE','HSI.HI','ar mean')
#资产4,5
armeanD45 = data.frame()
armeanL45 = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    armean = mean(data[(data[,4] == i)&(data[,5]==j),][,7])
    armeanL45 = c(armeanL45,armean)
    element = c(i,j,armean)
    armeanD45 = rbind(armeanD45,element)
  }
}
colnames(armeanD45) = c('SPX.GI','HSI.HI','ar mean')

levelplot(armeanD12$`ar mean`~armeanD12$X000001.SH+armeanD12$H11001.CSI)
levelplot(armeanD13$`ar mean`~armeanD13$X000001.SH+armeanD13$AU9999.SGE)
levelplot(armeanD14$`ar mean`~armeanD14$X000001.SH+armeanD14$SPX.GI)
levelplot(armeanD15$`ar mean`~armeanD15$X000001.SH+armeanD15$HSI.HI)
levelplot(armeanD23$`ar mean`~armeanD23$H11001.CSI+armeanD23$AU9999.SGE)
levelplot(armeanD24$`ar mean`~armeanD24$H11001.CSI+armeanD24$SPX.GI)
levelplot(armeanD25$`ar mean`~armeanD25$H11001.CSI+armeanD25$HSI.HI)
levelplot(armeanD34$`ar mean`~armeanD34$AU9999.SGE+armeanD34$SPX.GI)
levelplot(armeanD35$`ar mean`~armeanD35$AU9999.SGE+armeanD35$HSI.HI)
levelplot(armeanD45$`ar mean`~armeanD45$SPX.GI+armeanD45$HSI.HI)

