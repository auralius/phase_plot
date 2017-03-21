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

if nargin < 6
    scale = 0.5;
end

%% Solve the ODE
[~, x] = ode45(f, 0:0.001:simtime, intial_values); % ode45 at 1 khz

%% Vector field
% 2nd order ODE

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
    hold on;
    plot(x(:,1), x(:,2), 'b', 'LineWidth', 3);
    xlabel('x_1')
    ylabel('x_2')
    axis tight equal;
    xlim(range(1,:));
    ylim(range(2,:));
    hold off;


%fracparts=regexp(evalc('sys'),'([^\n]*)\n[ ]*-[-]+[ ]*\n([^\n]*)','tokens');
%TFlatex=['$$G(s)=\frac{' fracparts{1}{1} '}{' fracparts{1}{2} '}$$'];
%title(TFlatex, 'interpreter','latex');

end

