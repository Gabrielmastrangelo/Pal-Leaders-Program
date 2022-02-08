# Chapter 4 - Probability Concepts

### Goals for the session
+ Define the terms probability, experiment, event, and outcome.
+ Assign probabilities using the classical, empirical or subjective probability. 
+ Determine the number of outcomes using principles of counting.
+ Calculate probabilities using the rules of addition. 
+ Calculate probabilities using the rules of multiplication. 
+ Compute probabilities using a contingency table.
+ Use a tree diagram to organize and compute probabilities. 

### Computing Empirical Probabilities for Financial Markets (Statistical Application)

Today we are going to compute empirical probabilities for IVV, TIP and TSLA returns.
Where:
+ IVV represents the S&P 500 index
+ TIP represents the US government bonds
+ TSLA is the Tesla Stocks

**Empirical probability**, refers to a probability that is based on historical data. In other words, it illustrates the likelihood of an event occurring based on historical data.

**Note**: We can use conditional probabilities to have a sense of the relations between the returns of this different securities.

##### Calling the Libraries, and getting the data


```python
import yfinance as yf
import pandas as pd
import matplotlib.pyplot as plt
import warnings
import numpy as np

securities = ['TIP', 'IVV', 'TSLA']

def getPortfData(securities):
    '''
    The function gets a dictionary as input and calculates the historical return of the porfolio chosen
    '''
    basket_returns = []
    
    for asset in securities:
        security = yf.Ticker(asset).history(period="max")
        returns = security['Close'].pct_change().dropna()
        basket_returns.append(returns)

    hist_returns = pd.concat(basket_returns, 1)
    hist_returns.columns = securities
    hist_returns = hist_returns.dropna()
        
    return hist_returns

data = getPortfData(securities)
```

##### Probability of a positive return in the day


```python
(data > 0).mean()
```




    TIP     0.522751
    IVV     0.552515
    TSLA    0.517277
    dtype: float64



***Conclusion***: We can say that based on this data set, the empirical probability of a positive return in a random day is bigger than the probability of a negative return

##### Probability of a positive return given the last return

Probability of a positive return given that the last return was positive


```python
prob = ((data > 0) == (data > 0).shift(1)).mean()
prob
```




    TIP     0.496066
    IVV     0.490592
    TSLA    0.488539
    dtype: float64



Probability of a positive return given that the last return was negative


```python
1 -  prob
```




    TIP     0.503934
    IVV     0.509408
    TSLA    0.511461
    dtype: float64



***Conclusion***: We can say that based on this data set, the empirical probability of a positive return in a day given that the last daily return was negative is bigger than if it was positive.

##### Probability of TSLA having a positive return given the return of IVV

Probability of TSLA having a positive return given that the IVV had a positive return


```python
#Returns a dataframe with True for positive returns and False for negative
binom_data = data > 0

#Given that the return for IVV was positive
binom_data = binom_data[binom_data.IVV == True]

prob = binom_data.TSLA.mean()
prob
```




    0.6377708978328174



Probability of TSLA having a positive return given that the IVV had a negative return


```python
1 - prob
```




    0.3622291021671826



***Conclusion***: We can say that based on this data set, the empirical probability of a positive return for TSLA given that the IVV ETF had a positive return is bigger than if it was negative. Which makes sense, because we expected that TSLA returns have a positive correlation with the IVV returns (stock market index).

##### Probability of IVV having a positive return given the return of TIP

Probability of TSLA having a positive return given that the IVV had a positive return


```python
#Returns a dataframe with True for positive returns and False for negative
binom_data = data > 0

#Given that the return for IVV was negative
binom_data = binom_data[binom_data.IVV == False]

prob = binom_data.TIP.mean()
prob
```




    0.5963302752293578



***Conclusion***: We can say that based on this data set, the empirical probability of a negative return for IVV given that the TIP ETF had a positive return is bigger than if it was negative. Which makes sense, because we expected that IVV returns have a inverse correlation with the TIP returns (US government bonds).

### Materials

+ 9 - Presentation (Slides).pptx = Powerpoint Slides.
+ Exercises.xlsx = Solving exercises on Excel
+ probability.ipynb


```python

```
