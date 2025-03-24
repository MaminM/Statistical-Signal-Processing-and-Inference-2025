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

![[part_2_3.png]]

==Derivation is in the slides==

![[Pasted image 20250320092131.png | 300]]
![[Pasted image 20250320092213.png | 300]]

### Question 2

$N=5$, the ACF looks erratic, no clear structure reveals itself
$N=20$, the ACF starts to show more structure, but still noisy
$N=250$, the ACF reveals it's true pattern

**The effect of the mean** on the autocorrelation function is to artificially inflate it's value for larger lags.  
![[part2_3_q_2.png]]

### Question 3 - Yule-Walker Equations

The figure below clearly indicated 

![[Pasted image 20250320092402.png | 500]]

### Question 4

All three metrics aim to balance the reduction in error with the increase in complexity, they do so by different penalty terms.

For Minimum description length (MDL) and Akaike Information Criterion (AIC), the global minimum would indicate that model order of 9 is ideal. However, the first minimum is at the order of 2 and as expected, with the corrected AIC which is better for smaller samples sizes, the global minimum becomes more clear.

![[Pasted image 20250320175451.png]]
### Question 5

![[q5_horizons.svg| 700]]
The results show that increasing model order allows for more accurate predictions over a longer horizon.  AR(1) and AR(2) both fail at larger horizons, as we can see a model fail to capture the pattern.
This can be justified as in multi-step forecasting, error accumulation increases with prediction horizon, paradoxically favoring higher complexity models that overfit less in longer predictions.
The tradeoff between model order and prediction error becomes clear: extrapolation favours higher model orders, however, it increases the chances of overmodelling, where increased variance makes predictions more sensitive to noise.


## 2.4 Cramer-Rao Lower Bound

### Question 1a.

![[part2_4_1_combined.png]]

The PCF drops of far below the threshold of $\pm 1.96/\sqrt{N}$ for model order, $p> 1$.
The information theoretic criteria also show the same. The MDL and AIC do not show any obvious global minimum and the AIC corrected for smaller model order shows a clear optimal model order of $p=1$

### Question 1b.
The following derivations have been sourced from Stephen Kay’s ’Fundamentals of Signal Processing: Estimation Theory’. The PSD implied by the AR model is:

$$P_{xx}(f; \mathbf{\theta}) = \frac{\sigma_u^2}{|A(f)|^2} \quad (1)$$

where $\mathbf{\theta} = [a[1], a[2], \dots, a[p], \sigma_u^2]^T$ and $A(f) = \sum_{m=1}^{p} a[m] \exp(j2\pi fm)$. The partial derivatives are:

$$\frac{\partial \ln P_{xx}(f; \mathbf{\theta})}{\partial a[k]} = \frac{\partial \ln |A(f)|^2}{\partial a[k]} \quad (2)$$

$$= \frac{1}{|A(f)|^2} [A(f) \exp(j2\pi fk) + A^*(f) \exp(-j2\pi fk)] \quad (3)$$

$$\frac{\partial \ln P_{xx}(f; \mathbf{\theta})}{\partial \sigma_u^2} = \frac{1}{\sigma_u^2} \quad (4)$$

For $k = 1, 2, \dots, p$ and $l = 1, 2, \dots, p$, we have:

$$I[\mathbf{\theta}]_{kl} = \frac{N}{2} \int_{-0.5}^{0.5} \frac{1}{|A(f)|^4} [A(f) \exp(j2\pi fk) + A^*(f) \exp(-j2\pi fk)] \times [A(f) \exp(j2\pi fl) + A^*(f) \exp(-j2\pi fl)] df \quad (5)$$

$$= \frac{N}{2} \int_{-0.5}^{0.5} \frac{1}{A^*(f)^2} \exp(j2\pi f(k+l)) + \frac{1}{|A(f)|^2} \exp(j2\pi f(k-l)) + \frac{1}{|A(f)|^2} \exp(j2\pi f(l-k)) + \frac{1}{A^2(f)} \exp(-j2\pi f(l+k)) df \quad (6)$$

Using the Hermitian property of the integrand ($A(f) = A^*(f)$), we have

$$\int_{-0.5}^{0.5} \frac{1}{A^*(f)^2} \exp(j2\pi f(k+l)) df = \int_{-0.5}^{0.5} \frac{1}{A^2(f)} \exp(-j2\pi f(l+k)) df \quad (7)$$

$$\int_{-0.5}^{0.5} \frac{1}{|A(f)|^2} \exp(j2\pi f(k-l)) df = \int_{-0.5}^{0.5} \frac{1}{|A(f)|^2} \exp(j2\pi f(l-k)) df \quad (8)$$

Therefore,

$$I[\mathbf{\theta}]_{kl} = N \int_{-0.5}^{0.5} \frac{1}{A^*(f)^2} \exp(j2\pi f(k+l)) df + N \int_{-0.5}^{0.5} \frac{1}{|A(f)|^2} \exp(j2\pi f(k-l)) df \quad (9)$$

The second integral is the inverse Fourier transform of $\frac{1}{A^*(f)^2}$ evaluated at $n = k+l > 0$. This term is $0$ since the sequence is the convolution of 2 anti-causal sequences, i.e.,

$$\mathcal{F}^{-1} \left[ \frac{1}{A(f)} \right] = \begin{cases} h[n], & n \geq 0 \\ 0, & n < 0 \end{cases} \quad (10)$$

$$\mathcal{F}^{-1} \left[ \frac{1}{A^*(f)^2} \right] = \begin{cases} h[n] * h[n], & n < 0 \\ 0, & n \geq 0 \end{cases} \quad (11)$$

Therefore,

$$I[\mathbf{\theta}]_{kl} = \frac{N}{\sigma_u^2} r_{xx}(k-l) \quad (12)$$

We are given $I_{11}$, $I_{12}$ and $I_{21}$. For $k = p+1$ and $l = p+1$:

$$I[\mathbf{\theta}]_{kl} = \frac{N}{2} \int_{-0.5}^{0.5} \frac{1}{\sigma_u^4} df = \frac{N}{2\sigma_u^4} \quad (13)$$

Therefore,

$$I(\mathbf{\theta}) = \begin{bmatrix} \frac{N}{\sigma_u^2} R_{xx} & \mathbf{0} \\ \mathbf{0}^T & \frac{N}{2\sigma_u^4} \end{bmatrix} \quad (14)$$

where $[R_{xx}]_{ij} = r_{xx}(i-j)$ is a $p \times p$ Toeplitz autocorrelation matrix and $\mathbf{0}$ is a $p \times 1$ vector of zeros.

### Question 1c.
$$var(a[\hat k]) \geq \frac{\sigma^2_u}{N}[R_{xx}^-1]_{kk}\quad \text{for k = 1,2,...,p} \quad (15)$$
$$var(\sigma_u^2) \geq \frac{2\sigma_u^4}{N} \quad (16)$$
$$\text{Using p = 1,}\ (a[\hat 1]) \geq \frac{\sigma_u^2}{Nr_{xx}[0]} \quad (17)$$
$$\text{But } r_{xx}[0] = \frac{\sigma_u^2}{1-a^2[1]} \quad (18)$$
$$\text{So that } var(a[\hat 1] \geq \frac{1}{N}(1-a^2[1]) \quad (19)$$
Estimation of the filter parameter improves when $a[1]$ nears 1, not 0; because the filter's pole resides at $-a[1]$, processes with PSDs displaying sharp peaks offer enhanced parameter estimation.
#### i.

![[part_2_5_heatmap.svg]]


#### ii. ==NOT SURE==



### Question 1d.

For $p = 1$,
$$\hat{P}_x (f ; \theta) \Bigg|_{a_1} = \frac{\sigma^2}{2} \left[ e^{j2\pi f} A(f) + e^{-j2\pi f} A(f) \right] \frac{1}{|A(f)|^4} \quad(20)$$

$$= \frac{\sigma^2}{2} \left[ e^{j2\pi f} a_1 + e^{-j2\pi f} a_1 \right] \frac{1}{|A(f)|^4} \quad(21)$$

$$= \frac{\sigma^2}{2} \left[ 2 \cos(2\pi f) a_1 \right] \frac{1}{|A(f)|^4} \quad(22)$$

$$= \frac{\sigma^2 2 \cos(2\pi f) a_1}{|A(f)|^4} \quad(23)$$

and

$$\hat{P}_x (f ; \theta) \Bigg|_{\sigma^2} = \frac{1}{|A(f)|^2} \quad(24)$$

Thus,

$$\text{var} \left( \hat{P}_x (f ; \theta) \right) \leq \left[ \frac{\sigma^2 2 \cos(2\pi f) a_1}{|A(f)|^4} \right] \left[ \frac{1}{|A(f)|^2} \right] \left[ 1 - a_1^2 \right] \frac{1}{N} \quad(25)$$

$$= \left[ \frac{\sigma^4 2 \cos(2\pi f) a_1}{|A(f)|^4} \right] \left[ \frac{1}{|A(f)|^2} \right] \left[ 1 - a_1^2 \right] \frac{1}{N} \quad(26)$$

$$= \frac{1}{N} \left[ \frac{\sigma^4 4 (\cos(2\pi f) a_1)^2 (1 - a_1^2)}{|A(f)|^8} + \frac{\sigma^4}{|A(f)|^4} \right] \quad(27)$$




## 2.5 Real World Signals: ECG from iAMp experiment

### Part a.

It is important the note that, I am the person that was recorded and at the time I was sick. This impacted the recording as my heart rate was not stable and I got light-headed throughout the recording. This is reflected in the heart rate distribution failing the resemble a normal distribution.
![[part_2_5_pde.svg]]
### Part b.

Raw heart rate exhibits higher variance than smoothed data, suggesting lower Fisher information. 
Averaging by a factor of 10 reduces variance to σ/10, visually confirmed by the compact distribution at $α=0.6$. 

The α factor also reduces noise bias by shifting the averaged heart rate mean, $\hat h$. Notably, when $α=1$, the means of h and $\hat h$ coincide, implying lower mean and variance for $α=0.6$.

### Part c. - AR modelling of heart rate

The process is autoregressive due to it being sinusoidal and infinite in length. 
A moving average process have a finite length autocorrelation sequence.

![[part_2_5_acf.svg]]

### Part d. PCF and Information theoretic criterion

**Trial 1**
The partial autocorrelation function implies that the ideal model order is 1.
The global minimum of the different metrics are as follows:
- MDL is order 3
- AIC is order 2
- corrected AIC is order 2
- Cumulative MSE is order 10
Given that the only clear elbow is from the corrected AIC at an order of 2, and that the PACF strongly favours a lower model order, this process can be modelled as an AR(2) system.

![[part_2_5_pcf.png]]

**Trial 2**
The partial autocorrelation function implies that the ideal model order is 1.
The global minimum of the different metrics are as follows:
- MDL is order 2
- AIC is order 2
- corrected AIC is order 1
- Cumulative MSE is order 10

Given the results, we can conclude that this process can be modelled as an AR(1) process. 
![[part_2_5_trial2.png]]

**Trial 3**
The partial autocorrelation function implies that the ideal model order is 1.
The global minimum of the different metrics are as follows:
- MDL is order 1
- AIC is order 1
- corrected AIC is order 1
- Cumulative MSE is order 10

Given the results, we can conclude that this process can be modelled as an AR(1) process. 

![[part_2_5_trial3.png]]

# Part 3: Spectral Estimation

**Periodogram function**

- WGN was passed into `pgm.m`
- Since WGN input is real, the PSD is symmetric and the estimate reflects this clearly
- The periodogram's estimated PSD does not match the ideal PSD for WGN, which should be 1 at all frequencies
- The PSD is the FFT of the ACF
- unbiased ACF estimator's variance increases as $\tau$ increases
- This causes the periodogram estimator's variance to also increase for large $\tau$
- Increasing the number of samples makes the mean of the data tend to the ideal case but the variance does not converge to 0.
- The estimator is not consistent

The periodogram accurately reflects the symmetric PSD of real WGN input. 
However, it deviates from the ideal flat PSD. The PSD is derived from the ACF's FFT and the estimator's variance increases with lag. This impacts the periodogram's variance. 

Increased sample size improves mean convergence to the ideal PSD. However, the variance remains. Therefore, the periodogram estimator is inconsistent."

![[part_3_1_pgm.svg| 700]]

## 3.1 Averaged periodogram estimates

### Question 1

![[part_3_1_smooth_pgm.svg]]
Smoothing approximates the function, retaining important trends while removing noise and other sharp details. 
Visually, the smoothed periodogram shows lower variance and thus appears to be a better estimate.
