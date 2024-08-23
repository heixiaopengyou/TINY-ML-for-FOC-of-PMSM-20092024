% Switching through several network configurations and number of iterations

% Using Adam or Sgd Optimizers
params = [
    optimizableVariable('MainBranch1_initial_layer',[1 32],'Type','integer')
    optimizableVariable('MainBranch2_initial_layer',[1 24],'Type','integer')
    optimizableVariable('MainBranch1_second_layer',[1 16],'Type','integer')
    optimizableVariable('MainBranch2_second_layer',[1 12],'Type','integer')
    optimizableVariable('MainBranch1_third_layer',[1 8],'Type','integer')
    optimizableVariable('MainBranch2_third_layer',[1 6],'Type','integer')
    optimizableVariable('MainBranch1_fourth_layer',[1 4],'Type','integer')
    optimizableVariable('MainBranch2_fourth_layer',[1 3],'Type','integer')
    optimizableVariable('InitialLearningRate',[0.01 0.1], 'Type','real')
    optimizableVariable('Dropout',[0.1 0.9], 'Type','real')
    ];

% Using Limited BFGS Optimization
params = [
    optimizableVariable('MainBranch1_initial_layer',[1 32],'Type','integer')
    optimizableVariable('MainBranch2_initial_layer',[1 24],'Type','integer')
    optimizableVariable('MainBranch1_second_layer',[1 16],'Type','integer')
    optimizableVariable('MainBranch2_second_layer',[1 12],'Type','integer')
    optimizableVariable('MainBranch1_third_layer',[1 8],'Type','integer')
    optimizableVariable('MainBranch2_third_layer',[1 6],'Type','integer')
    optimizableVariable('MainBranch1_fourth_layer',[1 4],'Type','integer')
    optimizableVariable('MainBranch2_fourth_layer',[1 3],'Type','integer')
    optimizableVariable('MaxIterations',[30 70], 'Type','integer')
    optimizableVariable('Dropout',[0.1 0.9], 'Type','real')
    ];
    
obj_function = hyperparameterstuning(Ds_Train, Ds_Val, Ds_Test);

BayesObject = bayesopt(obj_function,params, ...
    'MaxTime',60*60, ...
    'MaxObjectiveEvaluations', 99, ...
    'IsObjectiveDeterministic',false, ...
    'UseParallel',false);
