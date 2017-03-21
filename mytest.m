close all;
s = tf('s');

% 3rd order system
figure
G = 1/((s+1)*(s+1)*(s+1));
phase_plot(G, [-0.1 0 0]', [-.1 .1; -.1 .1; -.1 .1], 10)

% 2nd order system
figure
G = 1/((s+1)*(s+2));
phase_plot(G, [-0.1 0]', [-.1 .1; -.1 .1], 10)
