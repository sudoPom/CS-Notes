# Summary Statistics

A number calculated from data is known as a statistic. A number that can be used to summarise data is known as a `summary statistic`

## Measures of location

Used to measure the location of  values in the data set.

* `Sample mean` is the average of all data points. Calculated by the sum of all values divided by the sample size. The mean is most commonly use for the measure of location.
* `Sample median` the value at which the same number of values lie above it as below it. If the sample size is odd then the sample median is just the middle value. If the sample size is even then there are two middle values. The sample median in this case will be the average of the two middle values. This is more informative if the distribution is strongly skewed. (No interpolation is needed for this module)

* `Sample mode` is the value that occurs the most.

## Measures of Dispersion

Used to measure the spread of values in the data set.

* The `sample variance` is computed as follows: 
  $$
  \begin{align}
  s^2 = \frac{1}{n-1}\sum^{n}_{i=1}(x_i-\bar{x})^2
  \newline
  s^2 = \frac{1}{n-1}\sum^{n}_{i=1}x_i^2 - n\bar{x}^2
  \end{align}
  $$
  This calculates the average distance from the from sample mean and each data point. If the data is a frequency distribution then each difference between the data point and the mean needs to be multiplied by the frequency of that data point.

  

* `sample standard deviation` is equal to the square root of the sample variance, and is in the unit of the value of the data set. In a normal distribution, 95% of the data lies within two standard deviations of the mean.

* `range` is the difference between the largest and smallest values.

* `interquartile range` is the range of the middle half of the data, making it less sensitive to extreme observations than the range is. It can be calculated by calculating $Q_3-Q_1$ where:

  * $Q_1$ is the average of the $\frac{n}{4}$th observation and the $(\frac{n}{4}+1)$th smallest observations.

  * $Q_3$ is the average of the  $\frac{n}{4}$th observation and the $(\frac{n}{4}+1)$th largest observations.

    If $\frac{n}{4}$ is not a while number then you take the $[\frac{n}{4}]+1$th value (round up)

* `Sample coefficient of variation` measures the sample spread of the data relative to their mean:
  $$
  CV = \frac{S}{\bar{x}}
  $$
  It is expressed as a percentage that can be larger than 100% (or 1.0) and is typically used on data sets containing only positive numbers.

Taking the mean of the population will result in $\mu$, the `true mean`. The sample mean $\bar{x}$ is an estimate of the true mean. This is similar for all other summary statistics.