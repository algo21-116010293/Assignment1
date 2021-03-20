library('scatterplot3d')
library('rgl')
library('MASS')
library('lattice')
data = read.csv('C:/Users/admin/Desktop/风险预算配置结果.csv')
data = data[,2:11]
SH = data[,1];CSI = data[,2];SGE = data[,3];GI = data[,4];HI = data[,5]
av = data[,6];ar = data[,7];sr = data[,8];mddr = data[,9]
srMDDR = data[,10]
ratio = c(0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1)
#av
avmeanD = data.frame()
avmeanList = c()
for (i in ratio){
  jrange = c()
  for (m in 0:(10-i*10)){
    jrange = c(jrange,m/10)
  }
  for (j in jrange){
    avmean = mean(data[(data[,1] == i)&(data[,2]==j),][,7])
    avmeanList = c(avmeanList,avmean)
    element = c(i,j,avmean)
    avmeanD = rbind(avmeanD,element)
  }
}
colnames(avmeanD) = c('X000001.SH','H11001.CSI','av mean')
levelplot(avmeanFrame$`av mean`~avmeanD[,1]+avmeanD[,2])

plot3d(SH,CSI,av,col = 'blue',size = 4)


#线性回归
fit1 = lm(av~SH+CSI+SGE+GI)#与SH相关性弱，R^2 = 0.65
fit2 = lm(ar~SH+CSI+SGE+GI)#与GI不是很相关，R^2 = 0.43
fit3 = lm(sr~SH+CSI+SGE+GI)#R^2 = 0.79
fit4 = lm(mddr~SH+CSI+SGE+GI)  #与SH的关系不大,与GI相关性较弱，R^2 = 0.56
fit5 = lm(srMDDR~SH+CSI+SGE+GI)#与SH相关性弱，R^2 = 0.83
summary(fit1)
summary(fit2)
summary(fit3)
summary(fit4)
summary(fit5)

#主成分分析
pc = princomp(data[2:6])
summary(pc)
comp1 = pc$scores[,1]
comp2 = pc$scores[,2]
comp3 = pc$scores[,3]
comp4 = pc$scores[,4]
fit11 = lm(av~comp1+comp2+comp3)

#岭回归
ridge_fit = lm.ridge(srMDDR~SH+CSI+SGE+GI,lambda = seq(0,1,length = 100))
summary(ridge_fit)
plot(x = ridge_fit$lambda,y = ridge_fit$GCV,type = 'l')
matplot(x = ridge_fit$lambda,y = t(ridge_fit$coef),type = 'l')
lam = ridge_fit$lambda[which.min(ridge_fit$GCV)]
ridgeFit = lm.ridge(srMDDR~SH+CSI+SGE+GI,lambda = lam)
library(car)
vif(fit1)
