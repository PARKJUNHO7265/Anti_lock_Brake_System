% Controller Parameters
K = 100;               % hydraulic system amplification factor
T = 0.01;              % time constant to simulate braking system inertia

% Wheel Parameters
Jw = 0.02;             % wheel inertia [kg·m^2]

% Vehicle parameters
m = 75;                % total vehicle mass, [kg]
g = 9.81;              % gravitational accelerationt, [m/s^2]
rw = 1.25;             % wheel radius [m]
v0 = 44;               % initial vehicle speed [m/s]
