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