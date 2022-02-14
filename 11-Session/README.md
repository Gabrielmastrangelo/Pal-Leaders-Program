# Review Chapter 5 and 4

### Goals for the Session:
#### Chapter 4
+ Define the terms probability, experiment, event, and outcome. 
+ Assign probabilities using the classical, empirical or subjective probability. 
+ Determine the number of outcomes using principles of counting. 
+ Calculate probabilities using the rules of addition.  
+ Calculate probabilities using the rules of multiplication.  
+ Compute probabilities using a contingency table. 
+ Use a tree diagram to organize and compute probabilities. 
#### Chapter 5
+ Identify the characteristics of a probability distribution. 
+ Distinguish between discrete and continuous random variables. 
+ Compute the mean, variance, and standard deviation of a probability distribution. 
+ Explain the assumptions and compute probabilities of the binomial distribution 
+ Explain the assumptions and compute probabilities of the hypergeometric distribution.  
+ Explain the assumptions and compute probabilities of the Poisson distribution. 

## Hypergeometric Distribution

#### Characteristics:
+ There are only 2 possible outcomes. 
+ It results from a count of the number of successes in a fixed number of trials. 
+ The probability of a success is not the same on each trial. 

#### Formula

<img src="https://render.githubusercontent.com/render/math?math=P(x) = \frac{\binom{S}{x}\binom{N-S}{n-x}}{\binom{N}{n}} ">

Where:
+ N: size of population
+ S: number of success
+ n: number of observations
+ x: number of successes in n observations

**OBS: When the sample size is less than 5% of the population, the binomial distribution can be used to approximate the hypergeometric distribution. That is, when n < 0.05N, the binomial should suffice.**

## Poisson Distribution

#### Characteristics:
+ The random variable is the number of times some event occurs during a defined interval.   
+ The probability of the event is proportional to the size of the interval. 
+ The intervals do not overlap and are independent. 

#### Formula

<img src="https://render.githubusercontent.com/render/math?math=P(x) = \mu e^{-\mu} ">
