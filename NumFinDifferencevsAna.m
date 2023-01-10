% Check numerical finite difference vs. analytical
% Using sin as a basis as derivative of sin is cos
% Convergence Testing - change resolution to test

% scalars: lowercase
% vectors: 1 uppercase
% matrices: CAPS

% User input
np = 100;
x_max = 2*pi;

% Temp signal
X_vec = linspace(0, x_max, np); % dist
T_vec = sin(X_vec); % Temp

% Analytical derivative
Der_ana = cos(X_vec);

% Numerical derivative
% Temperature differences / Spatial differences - should be impossible with
% just a /
% The ./ means "each entry in vector 1 divide by each entry in vector 2".
% BE CAREFUL, as MATLAB doesn't warn you, it just tries to do it anyway...
Der_num = (T_vec(2:end)-T_vec(1:end-1))./(X_vec(2:end)-X_vec(1:end-1)); % Derivative equation as in notes

% Plot
% hfig unnecesary, but hfig makes things a bit cleaner...
% h is called handle graphics, making everything an object, storing these
% handles allows you to query parts of the figure...
h_fig = figure;
h_ax = axes(h_fig);
% plot - (axes, X, Y, line style, displayname, name)
plot(h_ax, X_vec, T_vec, '-r', 'DisplayName', 'sin(x)'); % series one - Temp signal
hold(h_ax, 'on');
plot(h_ax, X_vec, Der_ana, '-b', 'DisplayName', 'Analytical Derivative'); % series two - Analytical derivative
plot(h_ax, (X_vec(2:end)+(X_vec(1:end-1)))/2, Der_num, '*b', 'DisplayName', 'Numerical Derivative');

% Figure ornaments (visuals and improvements)
h_ax.XLim(2) = x_max;
grid(h_ax, 'on');