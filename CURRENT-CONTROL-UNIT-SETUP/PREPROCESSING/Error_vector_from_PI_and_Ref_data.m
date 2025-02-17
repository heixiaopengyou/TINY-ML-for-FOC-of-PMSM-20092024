%% Sample Error vector extraction from an Ideal control (case 1) and the original PI-based Control

data = PI_data_X; 
Ts = 3.3333e-5; % Sampling time
num_samples = size(data, 1); % Number of samples
time = (0:num_samples-1) * Ts; % Time axis in seconds
ref_quad_volt = data(:, 8); % Quadrature voltage with Overshoot
V_q = Ref_data_X(:,8); % Quadrature voltage without overshoot

FirstCase_data = data(:, [4, 6, 8]); % Data (4) --> Reference Quadrature Current, Data (6) --> Measured Quadrature Curent, Data (8) --> PI Quadrature Voltage
QuadVoltage_Error = V_q - FirstCase_data(:,3); % Error vector used for training
Full_dataset = [FirstCase_data, QuadVoltage_Error];
columnNames =  {'Reference Quadrature Current', 'Measured Quadrature Curent', 'PI Quadrature Voltage', 'Error Vector'};
Table_data = array2table(Full_dataset, 'VariableNames', columnNames);
Table_perm = Table_data(randperm(height(Table_data)), :);
