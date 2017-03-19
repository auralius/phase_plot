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

if nargin < 5
    scale = 0.5;
end

%% Solve the ODE
[num, den] = tfdata(sys);
n = length(den{:}) - 1;
fprintf('System order: %i\n', n);  

if (n < 2 || n > 3)
    disp('Cannot continue...');
    return
end

[t, x] = ode45(@f, 0:0.001:50, intial_values); % ode45 at 1 khz

%% Vector field
% 2nd order ODE
if n == 2
    x1 = linspace(range(1, 1), range(1, 2), 10);
    x2 = linspace(range(2, 1), range(2, 2), 10);

    [X1, X2] = meshgrid(x1, x2);
    u = zeros(size(X1));
    v = zeros(size(X2));

    t = 0; 
    for i = 1:numel(X1)
        X_DOT = f(t,[X1(i); X2(i)]);
        Vmod = sqrt(X_DOT(1)^2 + X_DOT(2)^2);
        u(i) = X_DOT(1)/Vmod;
        v(i) = X_DOT(2)/Vmod;
    end

    % Drawing
    h = quiver(X1, X2, u, v, 'r'); 
    h.AutoScaleFactor = scale;
    axis tight equal;
    hold on;

    plot(x(:,1), x(:,2), 'b', 'LineWidth', 3);
    xlabel('x_1')
    ylabel('x_2')
    axis tight equal;
    hold off;
    
% 3rd order ODE
elseif n == 3
    x1 = linspace(range(1, 1), range(1, 2), 10);
    x2 = linspace(range(2, 1), range(2, 2), 10);
    x3 = linspace(range(3, 1), range(3, 2), 10);

    [X1, X2, X3] = meshgrid(x1, x2, x3);
    u = zeros(size(X1));
    v = zeros(size(X2));
    w = zeros(size(X3));

    t = 0; 
    for i = 1:numel(X1)
        X_DOT = f(t,[X1(i); X2(i); X3(i)]);
        Vmod = sqrt(X_DOT(1)^2 + X_DOT(2)^2 + X_DOT(3)^2);
        u(i) = X_DOT(1)/Vmod;
        v(i) = X_DOT(2)/Vmod;
        w(i) = X_DOT(3)/Vmod;
    end

    % Drawing
    h = quiver3(X1, X2, X3, u, v, w, 'r'); 
    h.AutoScaleFactor = scale;
    axis tight equal;
    hold on;

    plot3(x(:,1), x(:,2), x(:,3), 'b', 'LineWidth', 3);
    xlabel('x_1')
    ylabel('x_2')
    zlabel('x_3')
    view([1 1 1]);
    hold off;
end

fracparts=regexp(evalc('sys'),'([^\n]*)\n[ ]*-[-]+[ ]*\n([^\n]*)','tokens');
TFlatex=['$$G(s)=\frac{' fracparts{1}{1} '}{' fracparts{1}{2} '}$$'];
title(TFlatex, 'interpreter','latex');

%% Callback function for the ODE solver
    function x_dot = f(t, x)
         A = tf2ss(num{:}, den{:});       
         x_dot = A * x;
    end

end