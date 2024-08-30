% Creating a Datastore from the Training Samples
ds = arrayDatastore(XTrain, 'IterationDimension', 1);
% Creating a minibatchqueue for projection pruning
mbq = minibatchqueue(ds, ...
    MiniBatchSize=64, ...
    MiniBatchFcn=@preprocessMiniBatchPredictors, ...
    MiniBatchFormat="CB");
% Neural Network Compression
[netProjected,info] = compressNetworkUsingProjection(dlnet, mbq);

% Visualizing the Layers of the Pruned Model
netProjected.Layers
% Visualizing the Pruned Model Architecture
analyzeNetwork(netProjected)
