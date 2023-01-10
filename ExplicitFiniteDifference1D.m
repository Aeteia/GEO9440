% 1d explicit temperature
% Using sin as a basis as derivative of sin is cos
% Convergence Testing - change resolution to test

% scalars: lowercase
% vectors: 1 uppercase
% matrices: CAPS

% User input
np = 100; % number of points in space
nt = 2000; % number of points in time
x_max = 2*pi;
dt = 1e-3;
k = 1;
rho = 1;
cp = 1;


% Initial condition
X_vec = linspace(0, x_max, np); % dist
T_vec = sin(X_vec); % Temp

% Plot initiation
h_fig = figure;
h_ax = axes(h_fig);
plot(h_ax, X_vec, T_vec, '-r', 'DisplayName', 'Initial Condition');
hold(h_ax, 'on');
h_pl = plot(h_ax, X_vec, T_vec, '-b', 'DisplayName', 'Current State');
h_ax.XLim(2) = x_max;
grid(h_ax, 'on')
h_t = title('Step: 0');
legend;
drawnow; % Because computer is slow, requires a forced draw

% Time loop
Ind = 2:np-1;
for tstep = 1:nt
    T_vec(Ind) = T_vec(Ind) + dt*k/rho/cp*(... % New temp equals change in...
        ((T_vec(Ind+1)-T_vec(Ind))./(X_vec(Ind+1)-X_vec(Ind))) - ... % Tti+1 -Tti/Xi+1-Xi
        ((T_vec(Ind)-T_vec(Ind-1))./(X_vec(Ind)-X_vec(Ind-1))))./... % Tti - Tti-1/Xi-Xi-1
        ((X_vec(Ind+1)-X_vec(Ind-1))/2); 
    
    % Update plot
    h_pl.YData = T_vec;
    h_t.String = ['Step:', num2str(tstep)];
    drawnow;
end

