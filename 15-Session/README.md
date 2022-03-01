# Continuous Probability and Normal Distribution

## Characteristics

+ The normal curve is bell-shaped and has a single peak at the exact centre of the distribution.
+ The normal distribution is symmetrical about its mean. 
  +  That is, the arithmetic mean, median, and mode of the distribution are equal and located at the peak. 
+ The normal probability distribution is asymptotic. 
+ The location is determined by the mean, μ. The dispersion or spread is determined by the standard deviation, σ.

# Parametric or Gaussian Value At Risk 

As we did when computing the Empirical Value at Risk, we want to compute the worst possible outcome for a given risk level. For the Empirical model we calculated the VAR based on quantiles from historical returns. For computing the Parametric or Gaussian VAR, we assume that the returns are normally distributed, and we infer the mean and standard deviation.

### Assets

Last keep with the same ETFs, that will represent different assets classes with different risks.

- TIP: reflects a portfolio of U.S. Treasury bonds
- HYB: reflects a portfolio of U.S. high yield corporate bonds
- IVV: reflects the S&P 500 U.S. stock market index
- EWZ: reflects a Brazillian stock market index

### Visualization

<p align="center">
  <img src="https://github.com/Gabrielmastrangelo/Pal-Leaders-Program/blob/main/15-Session/plot.png">
</p>

### Conclusion

As we would expect, the least risk asset is the portfolio of USA Bonds, and the riskier asset is the ETF that represents the Brazillian stock market index.
