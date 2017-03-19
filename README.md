# phase_plot

```
function phase_plot(sys, intial_values, range, scale)
% Phase portrait plot for SECOND and THIRD order ODE
% sys is the system transfer function
%
% intial_values is ithe initial states of th system (vector of nx1)
%     where n is the order of the system
%
% range is the minimum and the maximum boundary for the states
%     e.g: 3rd order system, with states: x1, x2, and x3
%     [x1_min x1_max; x2_min x2_max; x3_min x3_max]
%
% scale is used to adjust the dimension of the arrows
%     this corresponds to the AutoScale property of the quiver function

% References:
%     http://matlab.cheme.cmu.edu/2011/08/09/phase-portraits-of-a-system-of-odes/
```

![alt tag](https://github.com/auralius/phase_plot/blob/master/example.png)