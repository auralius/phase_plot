function mytest4()
    close all;
    clear all;
    clc;
   
    phase_plot_interactive(@f, [-10 10; -10 10], 30, ...
        {'$\dot{x_1}=x_2$' '$\dot{x_2}=0.01*x_2^3-x_1$'}, [30 30])
end

%% Callback function for the ODE solver
function x_dot = f(t, x)
    x_dot(1,1) = x(2);
    x_dot(2,1) = 0.01*x(2)^3-x(1);
end



