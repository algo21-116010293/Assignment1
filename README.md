# Portfolio Construction Based on Risk Budget Models
This Git repo focuses on the risk budget model and how to construct portfolio in real market according to it.  


## Content
* Introduction to Risk Budget Model. 
* Empirical Study
* Backtesting
* Asset Allocation
* Conclusion
* Further Analysis
* Reference
* Contact

## Introduction to Risk Budget Model

Risk can be measured in many ways.  
  
Risk budget is the probability of risk.  
  
Risk budget model comes from the management of risk, which means customers are able to decide the risk of different asset at beginning and finally can be provided with a portfolio that produce the greatest profit.  

Suppose a portfolio contains n assets and the allocation is `w = (w1,w2,...,wn)`, where `wi` means the weight of asset i in this portfolio. Through the information about these 5 asssets and use this model, we can finally get the optimal portfolio that minimize the risk.   

More mathematical details can be seen in 
[Mathematical Explaination](https://github.com/algo21-116010293/Assignment1/wiki)


## Empirical Study
In this part, 5 assets(i.e. 000001.SH, H11001.CSI, AU9999.SGE, SPX.GI, HSI.HI) from January 2006 to June 2019 are used to built the risk budget model. These assets are selected because they can represent different  market. Data are downloaded from Wind as daily price and can be seen in the [Asset Data](https://github.com/algo21-116010293/Assignment1/blob/main/asset.xlsx)  

### 1. Generate Risk Budget Table
Firstly, risk budget of these 5 assets should be settled. In order to consider different risk preference for different customers, this project use 1001 kinds of      situation, namely the unit change of risk budget is 0.1. Table1.1 shows part of the risk budget of these portfolios.   

  *Table: risk budget table*    

Underlying Asset|000001.SH|H11001.CSI|AU9999.SGE|SPX.GI|HSI.HI  
----------------|---------|----------|----------|------|------  
1  | 0.0  | 0.0  | 0.0  | 0.0  | 1.0   
2  | 0.0  | 0.0  | 0.0  | 0.1  | 0.9   
3  | 0.0  | 0.0  | 0.0  | 0.2  | 0.8  
...  | ...  | ...  | ...  | ...  | ...  
1000  | 0.9  | 0.1  | 0.0  | 0.0  | 0.0  
1001  | 1.0  | 0.0  | 0.0  | 0.0  | 0.0  

### 2. Construct Model  
In [Mathematical Explaination](https://github.com/algo21-116010293/Assignment1/wiki), objective function and some parameters ahould be defined first to build this model.    

The **objective function** can be defined as: 
```Python
def aimFunc(w,covmat,risk):  
    np_risk = np.asmatrix(risk)  
    tmc,tc = parameters(w,covmat)  
    fun = np.sum(np.multiply(tmc-tc*np_risk,tmc-tc*np_risk)) 
    return fun
```              
   
The **parameters** *volatility* is defined based on daily return of the data during last 3 years if the time window is greater than or equal to ten years, last 1 year if the time window is between one year and ten year, all data if the time window is less than one year. Then calculate the vovatility matrix.     
  
The *risk measure*, *marginal risk* and *marginal risk contribution* are defined like this:  
```Python  
def parameters(w,covmat):
    # risk measure
    tc = np.sqrt(w*covmat*w.T)[0,0]   
    # miginal risk
    mc = w*covmat / tc           # 6*1
    # marginal risk contribution
    tmc = np.multiply(w,mc)   # 6*1 
    return tmc,tc
```    
        
Obtaining the objective function and parameters, I use the function `minimize` from the package `scipy.optimize` in python to caculate the asset weights:
```Python
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
```  

Through the above process, we can get every day optimal asset allocation for each of the 1001 cases, which can be used to do backtesting. However, in reality, it is costly to adjust pisition everyday, so I choose **monthly adjustment** to do backtesting, which means only the asset allocation at the beginning of every month will be kept.    

## Backtesting
The backtesting is still based on the time period during January 2006 to June 2019, meaning that it is an in sample test. Here, I use *Annual Return Rate*, *Annual Volatility*, *Sharp Ratio* and *Maximum Drawdown Rate* to be the indicators. Here, I set risk free rate to be a constant 0.03.  

The final result is shown in [Allocation Result](https://github.com/algo21-116010293/Assignment1/blob/main/Backtesting%20Result/bt_result.xlsx). This table contains the values of indicators and correponding risk budget situation.  

Here, I will show the result more visually.  

* **Single Asset**  
This part aims to show the relationship between indicators and risk budget of each asset
*The annual return rate under different risk budget for each asset*
![ARR](https://github.com/algo21-116010293/Assignment1/blob/main/Backtesting%20Result/annualReturn.jpg)
*The annual Volatility under different risk budget for each asset*
![AV](https://github.com/algo21-116010293/Assignment1/blob/main/Backtesting%20Result/annualVol.jpg)
*The Sharp Ratio under different risk budget for each asset*
![SR](https://github.com/algo21-116010293/Assignment1/blob/main/Backtesting%20Result/SR.jpg)
*The Maximum Drawdown Rate under different risk budget for each asset*
![MDDR](https://github.com/algo21-116010293/Assignment1/blob/main/Backtesting%20Result/MDDR.jpg)

> It can be conducted that the movement of H11001.CSI is different from the other four assets.   
>   
> * For H11001.CSI, the *Annual Return Rate* , *Annual Volatility* and *Maximum Drawdown Rate* are decreasing as the risk budget increases, the *Sharp Ratio* is increasing as the risk budget increases.  
>   
> * For 000001.SH, AU9999.SGE, SPX.GI, HSI.HI, the indicators move in oppposite way as H11001.CSI.  
>   
> The conclusions may be that H11001.CSI is a more conservative choice when building portfolios.  

* **Combination of two assets**  
In this part, I use the combination of any two of these four assets to show the relationship between indicators and their risk budgets. Because of the limit of page, I only show one relationship that is between *Annual Volatility* and the combination of 000001.SH and H11001.CSI together

*The average annual return rate v.s. the risk budget of 000001.SH and H11001.CSI*
![com](https://github.com/algo21-116010293/Assignment1/blob/main/Backtesting%20Result/combination.jpg)

> Combined with other relationships, I get the conclusion as:   
> * For *Annual Return Rate*, it has no obvious relationship with asset combinations but is correlated with the risk budget with single asset.  
> * For *Annual Volatility*, the larger the sum of any two risk budgets from 000001.SH, AU9999.SGE, SPX.GI, HSI.HI is, the larger annual volatility will occur.  
> * For *Sharp Ratio*, if the weight of H11001.CSI in the portfolio is more than 0.3, then it has high Sharp Ratio; if the portfolio contains no 000001.SH with high weight of AU9999.SGE or contains no AU9999.SGE with high weight of 000001.SH, it is more likely to have low Sharp Ratio. 
> * For *Maximum Drawdown Rate*, if the weight of H11001.CSI in the portfolio is more than 0.2, then it has low maximum drawdown rate and no matter what the proportion is, the maximum drawdown rate will not be various.   


## Asset Allocation
Asset can be divided into three types according to the risk preference of different customers: **Conservative**, **Banlance** and **Radical**. In this repo, I choose the risk budget of H11001.CSI to do division because other four assets are all risky asset. More specific, is the value of risk budget of H11001.CSI is larger than 0.3, the portfolio belongs to **Conservative**; if it is between 0.1 and 0.3, **Balance**; if it is lower than 0.1, **Radical**. Based on the conclusion from last part, I choose some representive portfolio that have good performance for each of the three types.  

### 1. Conservative
*Table: Conservative Portfolio*  
                                            
|No.|000001.SH|H11001.CSI|AU9999.SGE|SPX.GI|HSI.HI|Annual Return Rate|Annual Volatility|Sharp Ratio|Maximum DD Rate|          
|---|---------|----------|----------|------|------|------------------|-----------------|-----------|---------------|      
| 1 | 0.1  | 0.9  | 0.0  | 0.0  | 0.0 | 0.0538 | 0.0191 | 1.2478 | 0.0404    
| 2 | 0.2  | 0.7  | 0.0  | 0.0  | 0.1 | 0.0538 | 0.0230 | 1.0965 | 0.0478       
| 3 | 0.1  | 0.3  | 0.4  | 0.2  | 0.0 | 0.0590 | 0.0291 | 0.9951 | 0.0526      

*Plot: The Net Value Curve and Asset Allocation of the above 3 portfolio*  
![C1](https://github.com/algo21-116010293/Assignment1/blob/main/Asset%20Allocation/C1.png)  
![C2](https://github.com/algo21-116010293/Assignment1/blob/main/Asset%20Allocation/C2.png)  
![C3](https://github.com/algo21-116010293/Assignment1/blob/main/Asset%20Allocation/C3.png) 

### 2. Balance
*Table: Balance Portfolio*  
                                            
|No.|000001.SH|H11001.CSI|AU9999.SGE|SPX.GI|HSI.HI|Annual Return Rate|Annual Volatility|Sharp Ratio|Maximum DD Rate|          
|---|---------|----------|----------|------|------|------------------|-----------------|-----------|---------------|      
| 1 | 0.2  | 0.1  | 0.4  | 0.3  | 0.0 | 0.0642 | 0.0637 | 0.5373 | 0.0991    
| 2 | 0.2  | 0.1  | 0.3  | 0.4  | 0.0 | 0.0715 | 0.0667 | 0.6215 | 0.1115       
| 3 | 0.3  | 0.1  | 0.2  | 0.4  | 0.0 | 0.0746 | 0.0716 | 0.6237 | 0.1325      

*Plot: The Net Value Curve and Asset Allocation of the above 3 portfolio*  
![B1](https://github.com/algo21-116010293/Assignment1/blob/main/Asset%20Allocation/B1.png)  
![B2](https://github.com/algo21-116010293/Assignment1/blob/main/Asset%20Allocation/B2.png)  
![B3](https://github.com/algo21-116010293/Assignment1/blob/main/Asset%20Allocation/B3.png) 

### 1. Radical
*Table: Radical Portfolio*  
                                            
|No.|000001.SH|H11001.CSI|AU9999.SGE|SPX.GI|HSI.HI|Annual Return Rate|Annual Volatility|Sharp Ratio|Maximum DD Rate|          
|---|---------|----------|----------|------|------|------------------|-----------------|-----------|---------------|      
| 1 | 0.6  | 0.0  | 0.2  | 0.2  | 0.0 | 0.0989 | 0.1426 | 0.4833 | 0.3985    
| 2 | 0.3  | 0.0  | 0.7  | 0.0  | 0.0 | 0.1120 | 0.1469 | 0.5585 | 0.3987             

*Plot: The Net Value Curve and Asset Allocation of the above 2 portfolio*  
![R1](https://github.com/algo21-116010293/Assignment1/blob/main/Asset%20Allocation/R1.png)   
        
![R2](https://github.com/algo21-116010293/Assignment1/blob/main/Asset%20Allocation/R2.png)      
    

## Conclusion
The optimal portfolio and its performance are related to the underlyings, especially to the stock and bond. That is, the annual return rate will increase as the weight of stock increases, the Sharp Ratio will increase as the weight of bond increases while the maximum drawdown rate will decrease as its weight increase.  

From the perspective of investment, three kinds of portfolios have their own pros and cons. The investors should choose the suitable one based on their risk preference.  

## Further Analysis
From the above process, I find some points that can be improved towards the Risk Budget Model.  
* Risk free rate. In this repo, I choose risk free rate to be a constant, however, it actually change in real world especially during the period of three years. Therefore, I may take the term structure models into consideration.
* The constraints. In the risk budget model, the constraint is only one that all weights sum to 1. Actually, more constraints can be added such as the expected return constraints. Then, Black-Litterman model can be involved to produce more optimal portfolios.  
All the considerations may be added into this repo further. If you have any ideas, welcome to come it up.  

## Reference
For this repo, I choose the research report from 
Shenwan Hongyuan Securities([Portfolio under Risk Budget Model](https://github.com/algo21-116010293/Assignment1/blob/main/Reference/20170531-申万宏源-申万宏源风险预算模型下的基金组合构建：配置风险，优选基金.pdf)) and 
Shanghai Securities([The Relationship between Risk Budget Model and FOF Underlying Asset](https://github.com/algo21-116010293/Assignment1/blob/main/Reference/风险预算模型与FOF底层资产的关系研究-FOF系列报告之2.pdf)).  

Both of the reports are written in Chinese and if I find some English versions, I will upload later.  

## Code
All the codes that are related to this repo are in the `riskBudget.py` [risk_budget_model code](https://github.com/algo21-116010293/Assignment1/blob/main/riskBudget.py)  

Also, I put the code in R in the folder [DataAnalysis](https://github.com/algo21-116010293/Assignment1/tree/main/DataAnalysis) that is used to generate the plots in **Asset Allocation** sector.  

## Contact
If you have any issues or ideas towards this repo, welcome to leave your note. 


