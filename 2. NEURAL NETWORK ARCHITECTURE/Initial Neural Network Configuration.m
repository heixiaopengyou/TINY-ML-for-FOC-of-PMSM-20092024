net = dlnetwork;
tempNet = featureInputLayer(3,"Name","featureinput");
net = addLayers(net,tempNet);

tempNet = [
    fullyConnectedLayer(32,"Name","fc","WeightsInitializer","he")
    dropoutLayer(0.1,"Name","dropout")
    fullyConnectedLayer(16,"Name","fc_4","WeightsInitializer","he")
    dropoutLayer(0.1,"Name","dropout_1")
    fullyConnectedLayer(8,"Name","fc_6","WeightsInitializer","he")];
net = addLayers(net,tempNet);

tempNet = fullyConnectedLayer(8,"Name","fc_1","WeightsInitializer","he");
net = addLayers(net,tempNet);

tempNet = [
    fullyConnectedLayer(24,"Name","fc_2","WeightsInitializer","he")
    dropoutLayer(0.1,"Name","dropout_2")
    fullyConnectedLayer(12,"Name","fc_5","WeightsInitializer","he")
    dropoutLayer(0.1,"Name","dropout_3")
    fullyConnectedLayer(6,"Name","fc_7","WeightsInitializer","he")];
net = addLayers(net,tempNet);

tempNet = fullyConnectedLayer(6,"Name","fc_3","WeightsInitializer","he");
net = addLayers(net,tempNet);

tempNet = [
    additionLayer(2,"Name","addition")
    tanhLayer("Name","tanh")
    fullyConnectedLayer(4,"Name","fc_8","WeightsInitializer","he")
    dropoutLayer(0.1,"Name","dropout_4")];
net = addLayers(net,tempNet);

tempNet = fullyConnectedLayer(4,"Name","fc_13","WeightsInitializer","he");
net = addLayers(net,tempNet);

tempNet = [
    additionLayer(2,"Name","addition_1")
    tanhLayer("Name","tanh_1")
    fullyConnectedLayer(3,"Name","fc_9","WeightsInitializer","he")
    dropoutLayer(0.1,"Name","dropout_5")];
net = addLayers(net,tempNet);

tempNet = fullyConnectedLayer(3,"Name","fc_14","WeightsInitializer","he");
net = addLayers(net,tempNet);

tempNet = [
    additionLayer(2,"Name","addition_2")
    fullyConnectedLayer(2,"Name","fc_11","WeightsInitializer","he")];
net = addLayers(net,tempNet);

tempNet = [
    additionLayer(2,"Name","addition_3")
    fullyConnectedLayer(2,"Name","fc_12","WeightsInitializer","he")];
net = addLayers(net,tempNet);

tempNet = [
    additionLayer(2,"Name","addition_4")
    fullyConnectedLayer(1,"Name","fc_10","WeightL2Factor",2,"WeightsInitializer","he")];
net = addLayers(net,tempNet);

% clean up helper variable
clear tempNet;

net = connectLayers(net,"featureinput","fc");
net = connectLayers(net,"featureinput","fc_1");
net = connectLayers(net,"featureinput","fc_2");
net = connectLayers(net,"featureinput","fc_3");
net = connectLayers(net,"fc_1","addition/in2");
net = connectLayers(net,"fc_3","addition_1/in2");
net = connectLayers(net,"fc_6","addition/in1");
net = connectLayers(net,"fc_6","fc_13");
net = connectLayers(net,"fc_13","addition_2/in1");
net = connectLayers(net,"fc_7","addition_1/in1");
net = connectLayers(net,"fc_7","fc_14");
net = connectLayers(net,"fc_14","addition_3/in1");
net = connectLayers(net,"dropout_4","addition_2/in2");
net = connectLayers(net,"fc_11","addition_4/in1");
net = connectLayers(net,"dropout_5","addition_3/in2");
net = connectLayers(net,"fc_12","addition_4/in2");
net = initialize(net);
