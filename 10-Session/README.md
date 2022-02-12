# Chapter 5 - Binominal Probability Distribution

### Goals for the Session:
+ Identify the characteristics of a probability distribution.
+ Distinguish between discrete and continuous random variables.
+ Compute the mean, variance, and standard deviation of a probability distribution.
+ Explain the assumptions and compute probabilities of the binomial distribution

## Binominal Distribution

#### Caracteristics
1. An outcome of an experiment is classified into one of two mutually exclusive categories, such as a success or failure.  
2. The random variable is the result of counts. 
3. The probability of success remains the same from one trial to another.
4. The trials are independent. 

#### Formula

<img src="https://render.githubusercontent.com/render/math?math=P(x) = \binom{n}{x}p^x(1-p)^{n-x}">
Where:
  - n = number of trials 
  - x = is the number of observed successes 
  - p = is the probability of success on each trial 

Mean:
<img src="https://render.githubusercontent.com/render/math?math=\mu = np">

Standard Deviation:
<img src="https://render.githubusercontent.com/render/math?math=\sigma = np(1-p)">

## Statistical Application
We are going to build functions to calculate automatically for us the probabilitie, mean and standard deviation of a binominal function given the parameters.

### Importing the libraries


```python
import numpy as np
```

## Building the Functions

There are libraries that compute it automatically, but for the sake of learning, and to use the theoretical fundations from the Course, let's write our on function to calculate the probability.

### Computing Combination

We know that the equation is:</br>
<img src="https://render.githubusercontent.com/render/math?math=nCk = \binom{n}{x} = \frac{n!}{x!(n-x)!}">

```python
def combination(n, x):
    '''
    Computes the combination given n and x
    '''
    return np.math.factorial(n)/(np.math.factorial(x)*np.math.factorial(n-x))
```

### Computing P(x)


```python
def binomProb(n, x, p, accum = False):
    ''' 
    Computes the probability of a Binomial Distribution
    n = number of trials
    x = number of success
    p = probability of success
    
    And if accum = True, calculates the probability of P(x <= k), where k <= n and is a integer
    
    '''
    if accum:
        px = 0
        for i in range(x+1):
            px = px + combination(n, i)*(p**i)*(1-p)**(n-i)
        return px
    return combination(n, x)*(p**x)*(1-p)**(n-x)
```

### Computing the parameters 
Mean and standard deviation.


```python
def mean(n, p):
    '''
    Computes the mean for the Binomial Distribution
    '''
    return n*p

def sd(n, p):
    '''
    Computes the standard deviation for the Binomial Distribution
    '''
    return n*p*(1-p)
```

## Using the built functions for Solving Problems

Let's say that you have a portfolio with 20 stocks. And for each one the probability of getting a positive return is of 60%. <br>

1. What is the probability of 10 stocks from your portfolio generating a positive return?


```python
n = 20
x = 10
p = 0.6
prob = binomProb(n, x, p)
print(f'P(x = 10) = {round(prob*100, 2)}%')
```

    P(x = 10) = 11.71%
    

2. What is the probability of 10 stocks or less from your portfolio generating a positive return?


```python
n = 20
x = 10
p = 0.6
prob = binomProb(n, x, p, True)
print(f'P(x <= 10) = {round(prob*100, 2)}%')
```

    P(x <= 10) = 24.47%
    

4. What is the probability of less than 10 stocks from your portfolio generating a positive return?

We know that P(x < 10) = P(x <=10) - P(x = 10)


```python
n = 20
x = 10
p = 0.6
probLess10 = binomProb(n, x, p, True)
probEqual10 = binomProb(n, x, p)
prob = probLess10 - probEqual10
print(f'P(x < 10) = {round(prob*100, 2)}%')
```

    P(x < 10) = 12.75%
    

5. What is the mean and standard deviation of this distribution?


```python
print('Mean =', mean(n, p))
print('Standard Deviation =',round(sd(n, p), 2))
```

    Mean = 12.0
    Standard Deviation = 4.8
    

### Materials
+ 10 - Presentation (Slides).pptx = Powerpoint Slides.
+ 10 - Exercises 2.xlsx = This has the solutions for the exercises that we solved in the Excel.


```python

```
