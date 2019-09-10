# About
We investigated the reliability of the timing of spikes in a spike train in a Morris-Lecar model with several extensions. A frozen Gaussian noise current, superimposed on a DC current, was injected. The neuron responded with spike trains that showed trial-to-trial variability. The reliability depends on the shape (steepness) of the current input versus spike frequency output curve. The model also allowed to study the contribution of three relevant ionic membrane currents to reliability: a T-type calcium current, a cation selective h-current and a calcium dependent potassium current in order to allow bursting, investigate the consequences of a more complex current-frequency relation and produce realistic firing rates.

Zeldenrust, F., Chameau, P. J. P., & Wadman, W. J. (2013). Reliability of spike and burst firing in thalamocortical relay cells. Journal of Computational Neuroscience, 35, 317–334. https://doi.org/10.1007/s10827-013-0454-8 <br />

Please cite this reference when using this method.

# Use
The XPP code can be run and set with MATLAB (using file runchange.m)
using the MATLAB-XPP interface that can be downloaded here:
http://www2.gsu.edu/~matrhc/XPP-Matlab.html

There were five sets of simulations
1 The original Prescott model: prescott
2 Model with added T-current: prescott + T
3 Model with added T-current and adaptation current: prescott + T+adap
4 Model with added T-current and h-current: prescott + T+h
5 Model with added T-current with variable gT: prescott+Tvar

All used the same input stimulus, taken from the experiments, stim.tab



