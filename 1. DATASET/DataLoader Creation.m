% Full_data = Dataset_Case1;
% Full_data = Dataset_Case2;
% Creating a Data Table
columnNames =  {'Reference_Speed', 'Measured_Speed', 'Reference_Iq', 'Error_measured'};
Table_data = array2table(Full_data, 'VariableNames', columnNames);

% Shuffle the data
Table_perm = Table_data(randperm(height(Table_data)), :);
% Number of samples
numSamples = size(Table_perm, 1);

% Calculate indices for splitting
trainEndIdx = round(0.8 * numSamples);
valEndIdx = trainEndIdx + round(0.5 * (numSamples - trainEndIdx));

% Split the data
Train_data = Table_perm(1:trainEndIdx, :);

Val_data = Table_perm(trainEndIdx+1:valEndIdx, :);

Test_data = Table_perm(valEndIdx+1:end, :);

% Extract input features and target output

XTrain = Train_data{:, 1:3};
TTrain = Train_data{:, 4};
XVal = Val_data{:, 1:3};
TVal = Val_data{:, 4};
XTest = Test_data{:, 1:3};
TTest = Test_data{:, 4};

Ds_Train = {XTrain, TTrain};
Ds_Val = {XVal, TVal};
Ds_Test = {XTest, TTest};
