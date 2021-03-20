import numpy as np
import pandas as pd
import datetime as dt
#import sympy as sp 
from scipy.optimize import minimize
import matplotlib.pyplot as plt
import matplotlib.dates as mdate

#导入数据
asset = pd.read_excel('C:/Users/admin/Desktop/risk_budget/资产.xlsx')   #资产价格
file_name = 'risk.csv'   
df = pd.read_csv(file_name,index_col=0)  
#df.columns = ['risk']
codes = list(df.index)
#risk = list(df['risk'])    #资产风险预算
r = [0.2,0.1,0.4,0.3,0]
#np_risk = np.asmatrix(r)

date = list(asset['DateTime'])
for i in range(0,len(date)):
    date[i] = str(date[i])[0:4] + str(date[i])[5:7]+str(date[i])[8:10]

#各种参数
def parameters(w,covmat):
    #总的风险度量
    tc = np.sqrt(w*covmat*w.T)[0,0]   
    #边际风险
    mc = w*covmat / tc           # 6*1
    #边际风险贡献率
    tmc = np.multiply(w,mc)   # 6*1 
    return tmc,tc

#目标函数
def aimFunc(w,covmat,risk):
    np_risk = np.asmatrix(risk)
    tmc,tc = parameters(w,covmat)
    fun = np.sum(np.multiply(tmc-tc*np_risk,tmc-tc*np_risk))
    return fun
    
def volatility_cov(day = None) : 
    if day is None :
        cal_day = (dt.datetime.now()- dt.timedelta(1)).strftime("%Y%m%d")
    else :
        cal_day = day
   
    #求波动率协方差矩
    ##连续cal_day的波动率
    index_end = date.index(str(cal_day))    
    ##判断采用多久的数据来计算cov
    testdata = asset[:index_end]
    ##若数据区间超过十年，则以前三年的行情数据计算协方差;小于一年的则用之前所有数据；一年到十年内的用前一年数据
    if len(testdata) > 252*10 : 
        cal_yr = 3
        index_start = index_end - 252*cal_yr
    elif len(testdata) < 252 and index_end != 0:
    #    lastmonth = begindays[index_end+1]
        index_start = 3
    else:
        cal_yr = 1
        index_start = index_end - 252*cal_yr
    ##计算cal_yr*252个波动率
    volatility = []
    for index in range(index_start,index_end+1):                 
        df_close_new = asset[:index]                     #前Date行
        ###波动率 = 252个 P(n)/P(n-1) -1 的标准差
        df_return = df_close_new[-252:][codes] / df_close_new.shift(1)[-252:][codes] - 1 
        volatility.append(np.std(df_return))
    ##波动率协方差
    volatility = np.array(volatility)
    df_cov = np.cov(volatility,rowvar = False)
    np_cov = np.asmatrix(df_cov)  
    return np_cov

 # 返回df_weight，输入时间%Y%m%d，缺省为现在时点
def cal_weight(risk,day = None):    
    np_cov = volatility_cov(day)
    func = lambda x: aimFunc(np.asmatrix(x),np_cov,risk)
    cons = {'type':'eq', 'fun':lambda x: sum(x)-1}
    bnds = tuple((0,1) for i in range(len(risk)))
    res = minimize(func, tuple(risk), method='SLSQP', bounds=bnds,constraints= cons , options={'ftol': 1e-30})
    
    w_list = list()
    x_sum = res.x.sum()
    for x_sol in res.x:
        weight = x_sol/x_sum
        w_list.append(weight)
    return w_list    

#calculate the index of the begin day of every month
def monthBegin(port):
    month_begin = [0]
    for i in range(len(port)-4):
        day = date[i]
        next_day = date[i+1]
        if day[0:6] != next_day[0:6]:
            month_begin.append(i+1) 
    return month_begin
fmb = monthBegin(asset)


#calculate the result dataframe of the begin days and portfolio weights
def cal_monthWeight(port,risk):
    #month_begin = monthBegin(port) = fmb
    begindays = []
    result = []
    for i in fmb:
        beginday = date[i]
        begindays.append(beginday)  
        result.append(cal_weight(risk,beginday))
    monthly_w = pd.DataFrame(result,columns=codes)
    monthly_w = pd.concat([pd.DataFrame(begindays),monthly_w],axis = 1)
    return monthly_w
fresult = cal_monthWeight(asset,r)


#把date和weight合成一张表
monthday = []
for i in range(len(fmb)-1):
    month = date[fmb[i]:fmb[i+1]]
    x = fresult[i:i+1][codes]
    weight = np.array(x).tolist()
    weight = weight[0]
    for j in range(len(month)):
        monthday.append(weight)
lm = date[fmb[-1]:len(date)]
lx = fresult[-1:][codes]
lw = np.array(lx).tolist()
lw = lw[0]
for k in range(len(lm)):
    monthday.append(lw)
fmonth_w = pd.DataFrame(monthday,columns=codes)
fmonth_w = pd.concat([pd.DataFrame(date),fmonth_w],axis = 1)


def cal_portReturn(port,risk,cost = 0.004):
    port_r = []
    #month_begin = monthBegin(port) = fmb
    monthly_w = cal_monthWeight(port,risk)
    asset = port[codes]
    returns = asset[codes] / asset.shift(1)[codes] - 1
    for i in range(len(fmb)-1):
        p_return = returns[fmb[i]:fmb[i+1]][codes]
        month_return = np.sum(np.multiply(p_return,monthly_w[i:i+1][codes]),axis = 1)
        port_r.extend(month_return)
    lp_return = returns[fmb[-1]:len(port)][codes]
    last_r = np.sum(np.multiply(lp_return,monthly_w[-1:][codes]),axis = 1)
    port_r.extend(last_r)
    '''
    #每月换仓减去换仓成本
    for i in fmb[1:]:
        port_r[i] = port_r[i] - cost
        '''
    return port_r
#fre = cal_portReturn(asset,r)
'''
##算1001种情况下的portreturn
portReturn1001 = []
for risk in risk_list:
    portr = cal_portReturn(asset,risk)
    portReturn1001.append(portr)
'''

#计算净值 P(n) = P(n-1) * (1+r(n))
def cal_netValue(port,risk):
    rrate = cal_portReturn(port,risk)
    p = 1
    net_v = []
    for i in range(len(port)):
        net_v.append(p*(1+rrate[i]))
        p = p*(1+rrate[i])
    return net_v
fnetP = cal_netValue(asset,r)


#计算最大回撤率   
def max_drawdown(port,risk):
    drawdown = []
    netValue = cal_netValue(port,risk)
    for i in range(1,len(port)):
        valueSec = netValue[:i]
        maxValue = max(valueSec)
        dd = (maxValue-netValue[i])/maxValue
        drawdown.append(dd)
    maxdrawdown = max(drawdown)
    return maxdrawdown
max_dd_rate = max_drawdown(asset,r)    


#计算年化收益率
def cal_annualReturn(port,risk):
    netP = cal_netValue(port,risk)
    times = len(port)//252
    annual_return = (netP[-1]/netP[0])**(1/times) - 1
    return annual_return
annualR = cal_annualReturn(asset,r)
#计算年化波动率
def cal_annualVolatility(port,risk):
    returnP =  cal_portReturn(port,risk)
    annual_volatility = np.std(returnP)*(252**0.5)
    return annual_volatility
annualV = cal_annualVolatility(asset,r)
#计算夏普利率
def cal_sharp(port,risk,rf_rate):
    annual_volatility = cal_annualVolatility(port,risk)
    annual_return = cal_annualReturn(port,risk)
    sharp = (annual_return-rf_rate)/annual_volatility
    return sharp
sharp_ratio = cal_sharp(asset,r,0.03)


#净值图
netP = pd.Series(fnetP)
ax = plt.gca()
ax.xaxis.set_major_formatter(mdate.DateFormatter('%Y-%m-%d'))  #横坐标格式
xs = [dt.datetime.strptime(d,'%Y%m%d').date() for d in date]
plt.plot(xs,netP)
plt.gcf().autofmt_xdate()  #日期旋转
plt.xlabel('Time')
plt.ylabel('net value')
plt.title('Net Value')
plt.show()

#每日资产权重图
ind = np.arange(len(fmonth_w))
colorlist = ['r','y','b','g','orange']
ax = plt.gca()
ax.xaxis.set_major_formatter(mdate.DateFormatter('%Y-%m-%d'))
for i in range(5):
    plt.bar(xs,fmonth_w[codes[i]],bottom = np.sum(fmonth_w[codes[:i]],axis = 1),color = colorlist[i])
plt.xlabel('Time')
plt.ylabel('proportion')
plt.title('The proportion of 5 assets in 20060104-20190617')
plt.legend(labels = codes,loc = 'best')
plt.gcf().autofmt_xdate()
plt.show()







