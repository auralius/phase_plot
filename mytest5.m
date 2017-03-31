function mytest()
    close all;
    clear all;
    clc;
   
    phase_plot_1_interactive(@f, [-4 4], 30, ...
        {'$\dot{x_1}=x^2-t$'}, [30 30])
end

%% Callback function for the ODE solver
function x_dot = f(t, x)
    x_dot = x^2-t;
end



