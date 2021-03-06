[![View Phase Plot with GUI for 1st and 2nd order ODE on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/62216-phase-plot-with-gui-for-1st-and-2nd-order-ode)

# phase_plot  
With transfer function in s-domain.  

```
% Phase portrait plot for SECOND and THIRD order ODE
% sys is the system transfer function (in s-domain)
%
% intial_values is ithe initial states of th system (vector of nx1)
%     where n is the order of the system
%
% range is the minimum and the maximum boundary for the states
%     e.g: 3rd order system, with states: x1, x2, and x3
%     [x1_min x1_max; x2_min x2_max; x3_min x3_max]
%
% simtime is the simulation time
%
% scale is used to adjust the dimension of the arrows
%     this corresponds to the AutoScale property of the quiver function

% References:
%     http://matlab.cheme.cmu.edu/2011/08/09/phase-portraits-of-a-system-of-odes/
```

# phase_plot2  
With callback function to allow the use of nonlinear function.  

```
function phase_plot2(f, intial_values, range, simtime, scale)
% Phase portrait plot for a SECOND order ODE
% f is the system function that will besolve using ode45, it must return 
%     a column vector (2x1).
%
% intial_values is ithe initial states of th system (vector of 2x1)
%
% simtime is the simulation time
%
% scale is used to adjust the dimension of the arrows
%     this corresponds to the AutoScale property of the quiver function

% References:
%     http://matlab.cheme.cmu.edu/2011/08/09/phase-portraits-of-a-system-of-odes/
```

![alt tag](https://github.com/auralius/phase_plot/blob/master/example.png)

# phase_plot_1_interactive   
![alt tag](https://github.com/auralius/phase_plot/blob/master/interactive1.gif)

# phase_plot_2_interactive   
![alt tag](https://github.com/auralius/phase_plot/blob/master/interactive2.gif)


