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

`<div style="page-break-after: always;"></div>`

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

## 2.1 ACF of uncorrelated and correlated sequences
### Question 1:
![[part2_1_q1.png | 500]]



Explanation of what is seen

Theoretically, two gaussian points are always uncorrelated
Theoretically the auto-correlation should be a dirac delta
This is reflected in our estimate.


### Question 2:

![[part2_1_q2_small.png]]

![[part2_1_q2_large.png]]


The `xcorr` gets noisier as `tau` increases.  ==*Why is this?*==
The unbiased estimator has the equation 
$$\hat R_X(\tau) = \frac{1}{N-|\tau|}\sum_{n=0}^{N-|\tau|-1}x[n]x[n+\tau], \quad \tau= -N+1,\dots,N-1$$
The factor of $\frac{1}{N - |\tau|}$ grows as $|\tau|$ increases. 
This is not good statistically because the large factor will amplify variance ==*how do I show this mathematically?*==

$$Var(\hat R_X(\tau)) = Var\left(\frac{1}{N-|\tau|}\sum_{n=0}^{N-|\tau|-1}x[n]x[n+\tau]\right), \quad \tau= -N+1,\dots,N-1$$
$$Var(\hat R_X(\tau)) = \frac{1}{(N-|\tau|)^2}\ Var\left(\sum_{n=0}^{N-|\tau|-1}x[n]x[n+\tau]\right)$$
For a stationary process, $Var\left(\sum_{n=0}^{N-|\tau|-1}x[n]x[n+\tau]\right)$ scales linearly with $\tau$
Proof:
$$\text{Var}\left(\sum_{n=0}^{N-|\tau|-1}x[n]x[n+\tau]\right) = \sum_{i=0}^{N-|\tau|-1}\sum_{j=0}^{N-|\tau|-1}\text{Cov}(x[i]x[i+\tau], x[j]x[j+\tau])$$

$$\text{Cov}(x[i]x[i+\tau], x[j]x[j+\tau]) = R_X(i-j)R_X(i+\tau-j-\tau) + R_X(i-j-\tau)R_X(i+\tau-j)$$

$$= R_X(i-j)R_X(i-j) + R_X(i-j-\tau)R_X(i-j+\tau)$$

$$\text{Let } k = i-j$$

$$\text{Var}\left(\sum_{n=0}^{N-|\tau|-1}x[n]x[n+\tau]\right) = \sum_{k=-(N-|\tau|-1)}^{N-|\tau|-1}(N-|\tau|-|k|)[R_X^2(k) + R_X(k-\tau)R_X(k+\tau)]$$

$$\text{For large } N \text{ and relatively small } \tau:$$

$$\text{Var}\left(\sum_{n=0}^{N-|\tau|-1}x[n]x[n+\tau]\right) \approx (N-|\tau|)\sum_{k=-\infty}^{\infty}[R_X^2(k) + R_X(k-\tau)R_X(k+\tau)]$$

$$\text{Let } V(\tau) = \sum_{k=-\infty}^{\infty}[R_X^2(k) + R_X(k-\tau)R_X(k+\tau)]$$

$$\text{Then: } \text{Var}\left(\sum_{n=0}^{N-|\tau|-1}x[n]x[n+\tau]\right) \approx (N-|\tau|)V(\tau)$$

$$\text{Variance of the estimator: } \text{Var}(\hat{R}_X(\tau)) \approx \frac{1}{(N-|\tau|)^2}(N-|\tau|)V(\tau) = \frac{V(\tau)}{N-|\tau|}$$

This shows that the variance increases as $|\tau|$ approaches $N$ due to the $\frac{1}{N-|\tau|}$ factor, even if $V(\tau)$ is relatively stable.

$V(\tau)$ increases with $\tau$ however the asymptotic behaviour is such that for large $|\tau|$ the function plateaus.


#QuestionToAsk *this explanation seems bs????*

### Question 3

The autocorrelation is
$$R_X(n,s) = \mathbb{E}\{X_nX_s\}$$
Assuming ergodicity, the **statistical expectation operator** can be approximated by **a time average** 
$$R_X(\tau) = \lim_{n\rightarrow\infty}\sum_{n=0}^{N-1}x[n]x[n+\tau], \quad \tau\in\mathbb{Z}$$
However, due to finite data, we consider the **unbiased** estimate given by
$$\hat R_X(\tau) = \frac{1}{N-|\tau|}\sum_{n=0}^{N-|\tau|-1}x[n]x[n+\tau], \quad \tau= -N+1,\dots,N-1$$

==Answer to the question==

empirical bound is 10% larger than the range in the first 50 samples


## 2.2 Cross-correlation function

### Question 1

![[Pasted image 20250307114729.png | 500]]

[[Important Facts I forget#Statistical Correlation|Definition of correlation]]
For a gaussian process $X,$
$$R_X = E(X(t)X(t-\tau)) = \begin{cases} 1 & \tau=0 \cr 0 & \tau\neq 0 \end{cases} = \delta(\tau)$$
The CCF can be found
$$R_{XY}(\tau) = h(\tau)\ *\ \delta(\tau)$$
using the filtering property: 
$$R_{XY} = h(\tau)\ *\ \delta(\tau) = \int h(u) \delta(\tau - u) du = h(\tau)$$
### Question 2
The CCF and ACF can be used in system identification to find the impulse response of a system. Primitive steps to do so are as follows:
- **Excite system** with controlled input (e.g., white noise).
- **Measure output response**.
- **Compute cross-correlation (CCF)** between input and output.
- **Compute autocorrelation (ACF)** of input.
- **Impulse response** $h[k]$ is proportional to CCF if input is white noise $(R_{XY}[k]∝ h[k]R_{XY}​[k]∝ h[k])$.
- **Unbiased estimator** under ideal conditions (white noise, no measurement noise).

#### The effect of filter length on the shape of the CCF of  `y`

The higher the filter order, the longer, in time, that the CCF "pulse" is present for.
The shape becomes more sinusoidal ==*why is that?*==
![[trial.png]]


## 2.3 Autoregressive Modelling
### Question 1

Stability analysis would require that one investigates the roots of the characteristic polynomial.
For the random process:
$$x[n] = a_1x[n-1] + a_2x[n-2] + w[n]$$
The characteristic equation becomes:
$$1 - a_1z^{-1}-a_2z^{-2} =0$$
For stability, the **all the roots must exist within the unit circle of the z-plane**
This is done in the code, file `cw2_3.m`, line 34-49. In particular
```
a = [1, -a1, -a2];
z = roots(a);
theoretical_convergence = all(abs(z) < 1);
```

![[part2_3_q_1.png]]


### Question 2

$N=5$, the ACF looks erratic, no clear structure reveals itself
$N=20$, the ACF starts to show more structure, but still noisy
$N=250$, the ACF reveals it's true pattern

**The effect of the mean** on the autocorrelation function is to artificially inflate it's value for larger lags.  
![[part2_3_q_2.png]]

### Question 3 - Yule-Walker Equations

