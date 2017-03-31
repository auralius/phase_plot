function mytest3()
    close all;
    clear all;
    clc;
   
    phase_plot_2_interactive(@f, [-10 10; -10 10], 10)
end

%% Callback function for the ODE solver
function x_dot = f(t, x)
    x_dot(1,1) = x(1) + 2*x(2);
    x_dot(2,1) = 3*x(1) + 2*x(2);
end



