# Part 1: Random Signals and Stochastic Processes
## 1.1 Statistical Estimation

### Uniform Distribution 
![[Pasted image 20250213192354.png|300]]
	_Figure: Plot of uniformly distributed random process over many realisations_
#### Question 1

Theoretical mean:
$\mathbb{E}\{X\} = \int_{-\infty}^{\infty} x \ p_X(x) \ dx$
$\mathbb{E}\{X\} = \int_{-\infty}^{\infty} x  \ dx$
$\mathbb{E}\{ X\} = \frac{1}{2}$


|                  | Trial 1 | Trial 2 | Trial 3 | Trial 4 | Trial 5 |
| ---------------- | ------- | ------- | ------- | ------- | ------- |
| Sample Mean      | 0.5049  | 0.5105  | 0.4859  | 0.4985  | 0.4973  |
| Percentage error | 0.9850  | 2.0993  | 2.8178  | 0.2948  | 0.5317  |
%% #DONTFORGET Add information of the Lehmann-Scheffe theorem to the appendix %%
The sample mean is an unbiased estimator of the population mean for a uniform distribution and, by the ==*Lehmann-Scheffé theorem* (add to appendix)== , is also the Minimum Variance Unbiased Estimator (MVU) in this case. According to the Cramér-Rao lower bound, as the sample size increases, the variance of the sample mean decreases $\left( \propto \frac{1}{N} \right)$, improving its accuracy for the uniform distribution.



#### Question 2
Theoretical standard deviation given that $\mathbb{E}\{X\} = \frac{1}{2}$
$\mathbb{E}\{X^2\} = \int_{0}^1 x^2 p_X(x) \ dx$
$\mathbb{E}\{X^2\} = \int_{0}^1 x^2 \ dx$
$\mathbb{E}\{X^2\} = \frac{1}{3}$
$\sigma_X^2 = \mathbb{E}\{X^2\} - \mathbb{E}\{X\}^2 = \frac{1}{3}- \frac{1}{4} = \frac{1}{12}$
$\sigma_X = \frac{1}{\sqrt{12}} \approx 0.2887$


|                  | Trial 1 | Trial 2 | Trial 3 | Trial 4 | Trial 5 |
| ---------------- | ------- | ------- | ------- | ------- | ------- |
| Sample std       | 0.2968  | 0.2805  | 0.2926  | 0.2974  | 0.2865  |
| Percentage error | 2.8286  | 2.8321  | 1.3501  | 3.0225  | 0.7707  |

The sample standard deviation is also an unbiased estimator of the population standard deviation for a uniform distribution and, by the Lehmann-Scheffé theorem, is also the Minimum Variance Unbiased (MVU) Estimator in this case. Naturally, we also see the inversely proportional relationship between sample size and variance in sample standard deviation.
 
#### Question 3

|       | Trial 1 | Trial 2 | Trial 3 | Trial 4 | Trial 5 | Trial_6 | Trial_7 | Trial_8 | Trial_9 | Trial_10 |
| ----- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | -------- |
| std   | 0.2968  | 0.2805  | 0.2926  | 0.2974  | 0.2865  |         |         |         |         |          |
| % err | 2.8286  | 2.8321  | 1.3501  | 3.0225  | 0.7707  |         |         |         |         |          |
The sample means are very close to the theoretical mean of 0.5, with the values clustering around this value, indicating minimal bias in the estimator. Similarly, the sample standard deviations are close to the theoretical value of 0.2887, with small variations, suggesting that the estimator for the standard deviation is also unbiased, but with slightly higher variability in the estimates.

#### Question 4

As the number of bins increases, the error and variance in the histogram estimate also increase, because the number of samples per bin decreases. This is crucial, as each bin acts as a parameter to estimate, and with fewer samples per bin, the estimation becomes less stable. According to estimation theory, increasing the sample size reduces the variance and error of the estimate, leading to a more accurate representation of the theoretical PDF.

![[Pasted image 20250214114945.png]]

### Standard Normal Distribution
![[initial_plot_gaussian.jpg| 300]]

#### Question 1
Theoretical mean
$\mathbb{E}\{X\} = \int_{-\infty}^{\infty} x \ p_X(x) \ dx$
$\mathbb{E}\{X\} = \int_{-\infty}^{\infty} x \ \frac{1}{\sqrt{2\pi}} e^{\frac{x^2}{2}} \ dx$
$\mathbb{E}\{X\} = 0$, due to odd function and symmetric interval

#### Question 2
Theoretical standard deviation 
$Var(X) = \sqrt{\left(\mathbb{E}\{X^2\} - \mathbb{E}\{X\}^2\right)}$
$Var(X) = \sqrt{\mathbb{E}\{X^2\}}$
$Var(X) = \sqrt{\left(\int_{-\infty}^{\infty} x^2 \ \frac{1}{\sqrt{2\pi}} e^{\frac{x^2}{2}} \ dx \right)}$
$Var(X) = 1$, using integration by parts



Both the sample mean and the sample standard deviation are unbiased estimators of the population mean and population standard deviation for a standard normal distribution and, by the Lehmann-Scheffé theorem, is also the Minimum Variance Unbiased Estimator (MVU) in this case also. According to the Cramér-Rao lower bound, as the sample size increases, the variance of decreases $\left(\propto \frac{1}{N}\right)$, improving its accuracy.

#### Question 3
|       | Trial 1 | Trial 2 | Trial 3 | Trial 4 | Trial 5 | Trial_6 | Trial_7 | Trial_8 | Trial_9 | Trial_10 |
| ----- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | ------- | -------- |
| std   | 0.2968  | 0.2805  | 0.2926  | 0.2974  | 0.2865  |         |         |         |         |          |
| % err | 2.8286  | 2.8321  | 1.3501  | 3.0225  | 0.7707  |         |         |         |         |          |

#### Question 4

![[Pasted image 20250214174400.png|500]]
More samples is always better
The number of bins affect how complex our pdf can be. We must pick the number of bins in accordance to the number of samples we have as to minimise variance.






<div style="page-break-after: always;"></div>


## 1.2 Stochastic Processes

#### Question 1

![[Pasted image 20250214174506.png|300]]
_Plot of ensemble mean of the three random processes as a function of time_
Function 1 is not a stationary process as the ensemble mean is time-dependent

Function 2 and 3 are stationary processes as the ensemble mean is a constant line across time, therefore time-independent.

#### Question 2

##### Random Process 1
**Mathematical Expression**
$\text{rp}_1(t) = \left[ u(t) - 0.5 \right]\times 5 \sin(\pi t) + 0.02t$
**Theoretical Ensemble Mean**
$\mathbb{E}\{\text{rp}_1(t)\} = \mathbb{E}\{u(t) - 0.5\} \times 5\sin (\pi t) + 0.02t$
$\mathbb{E}\{\text{rp}_1(t)\} = 0.02t$
==Therefore not ergodic==
**Theoretical Ensemble Standard Deviation**
$$\mathbb{E}\{(\text{rp}_1(t))^2\} = \mathbb{E}\left\{(u(t) - 0.5)^2\right\}\times 25\sin^2(\pi t) + (0.02t)^2 + 2\times 0.02t \times \mathbb{E}\left\{u(t) - 0.5\right\} \times 5\sin (\pi t)$$
$$\mathbb{E}\{(\text{rp}_1(t))^2\} = \mathbb{E}\left\{(u(t) - 0.5)^2\right\}\times 25\sin^2(\pi t) + (0.02t)^2$$
$$\mathbb{E}\left\{(u(t) - 0.5)^2\right\} = \frac{1}{12} = \mathbb{E}\{u^2(t)-u(t)+0.25\} = \frac{1}{3}-\frac{1}{2} + \frac{1}{4} = \frac{1}{12}$$
$$\mathbb{E}\{\text{rp}_1^2(t)\} = \frac{1}{12}\left(25\sin^2(\pi t) \right)  + (0.02t)^2$$
$$Var(\text{rp}_1(t)) = \mathbb{E}\{\text{rp}_1^2(t)\} - \mathbb{E}\{\text{rp}_1(t)\}^2 = \frac{25}{12}\sin^2(\pi t) + (0.02t)^2 - (0.02t)^2$$
$$Var(\text{rp}_1(t)) = \frac{25}{12}\sin^2(\pi t)$$
##### Random Process 2
**Mathematical Expression**
$\text{rp}_2(t) = \left[ u(t) - 0.5 \right]\times u(t) + u(t)$
**Theoretical mean**
$$ \mathbb{E}\{\text{rp}_2(t)\} = \mathbb{E}\{u^2(t)\} - 0.5 \mathbb{E}\{u(t)\} + \mathbb{E}\{u(t)\} = \mathbb{E}\{u^2(t)\} + 0.5 \mathbb{E}\{u(t)\}$$
$$\mathbb{E}\{\text{rp}_2(t)\} = \frac{1}{3} + \frac{1}{4} = \frac{7}{12} \approx 0.5833$$
==Therefore ergodic==
**Theoretical standard deviation**
$$\mathbb{E}\{\text{rp}_2^2(t)\} = \mathbb{E}\{u^4(t)\} + \frac{1}{4}\mathbb{E}\{u^2(t)\} + \mathbb{E}\{u^3(t)\}$$
We show that $\forall n \in \mathbb{N^+}$ we can show $$\mathbb{E}\{u^n(t)\} = \int_0^1 x^n dx = \frac{1}{n+1}$$
Therefore: $$\mathbb{E}\{\text{rp}_2^2(t)\} = \frac{1}{5} + \frac{1}{4}\left(\frac{1}{3}\right) + \frac{1}{4} = \frac{8}{15}$$
Finally: $$Var(\text{rp}_2(t)) = \mathbb{E}\{\text{rp}_2^2(t)\} - \mathbb{E}\{\text{rp}_2(t)\}^2 = \frac{8}{15} - \left( \frac{7}{12}\right)^2 = \frac{417}{2160} \approx 0.1931$$
##### Random Process 3
**Mathematical Expression**
$$\text{rp}_3(t) = [u(t) - 0.5]\times 3 + 0.5$$
**Theoretical Mean**
$$\mathbb{E}\{\text{rp}_3(t)\} = \mathbb{E}\{u(t) - 0.5\} \times 3+ 0.5$$
$$\mathbb{E}\{\text{rp}_3(t)\} = 0.5$$
==Therefore ergodic==

**Theoretical Standard Deviation**
$$\mathbb{E}\{\text{rp}_3^2(t)\} = \mathbb{E}\{(3u(t) - 1)^2\} = \mathbb{E}\{9u^2(t) -6u(t) + 1\} = 9\left(\frac{1}{3}\right) -6\left( \frac{1}{2}\right) + 1 = 3-3+1=1$$
$$Var(\text{rp}_3(t)) = \mathbb{E}\{\text{rp}_3^2(t)\} - \mathbb{E}\{\text{rp}_3(t)\}^2 = 1 - \left( \frac{1}{2}\right)^2 = \frac{3}{4}$$


![[random_processes_means_with_theory.jpg|500]]
<div style="page-break-after: always;"></div>
## 1.3 Estimation of probability distributions

*get figures from MATLAB file*  `cw_1_3.m`
### Question 1



### Question 2



# Part 2: Linear Stochastic Modelling

## Question 1:
*q1_xcorr_of_randn.jpg*

Explanation of what is seen

Theoretically, two gaussian points are always uncorrelated
Theoretically the auto-correlation should be a dirac delta

This is reflected in our estimate.

The `xcorr` gets noisier as `tau` increases.  ==*Why is this?*==

## Question 2:

