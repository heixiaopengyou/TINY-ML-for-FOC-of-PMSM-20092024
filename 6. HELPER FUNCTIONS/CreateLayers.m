function net = CreateLayers(Input_Size,MainBranch1_initial_layer, ...
        MainBranch2_initial_layer, ...
        MainBranch1_second_layer, ...
        MainBranch2_second_layer, ...
        MainBranch1_third_layer, ...
        MainBranch2_third_layer, ...
        MainBranch1_fourth_layer,...
        MainBranch2_fourth_layer, ...
        Dropout)
net = dlnetwork;
tempNet = featureInputLayer(Input_Size,"Name","featureinput");
net = addLayers(net,tempNet);

tempNet = [
    fullyConnectedLayer(MainBranch1_initial_layer,"Name","fc","WeightsInitializer","he")
    dropoutLayer(Dropout,"Name","dropout")
    fullyConnectedLayer(MainBranch1_second_layer,"Name","fc_4","WeightsInitializer","he")
    dropoutLayer(Dropout,"Name","dropout_1")
    fullyConnectedLayer(MainBranch1_third_layer,"Name","fc_6","WeightsInitializer","he")];
net = addLayers(net,tempNet);

tempNet = fullyConnectedLayer(MainBranch1_third_layer,"Name","fc_1","WeightsInitializer","he");
net = addLayers(net,tempNet);

tempNet = [
    fullyConnectedLayer(MainBranch2_initial_layer,"Name","fc_2","WeightsInitializer","he")
    dropoutLayer(Dropout,"Name","dropout_2")
    fullyConnectedLayer(MainBranch2_second_layer,"Name","fc_5","WeightsInitializer","he")
    dropoutLayer(Dropout,"Name","dropout_3")
    fullyConnectedLayer(MainBranch2_third_layer,"Name","fc_7","WeightsInitializer","he")];
net = addLayers(net,tempNet);

tempNet = fullyConnectedLayer(MainBranch2_third_layer,"Name","fc_3","WeightsInitializer","he");
net = addLayers(net,tempNet);

tempNet = [
    additionLayer(2,"Name","addition")
    tanhLayer("Name","tanh")
    fullyConnectedLayer(MainBranch1_fourth_layer,"Name","fc_8","WeightsInitializer","he")
    dropoutLayer(Dropout,"Name","dropout_4")];
net = addLayers(net,tempNet);

tempNet = fullyConnectedLayer(MainBranch1_fourth_layer,"Name","fc_13","WeightsInitializer","he");
net = addLayers(net,tempNet);

tempNet = [
    additionLayer(2,"Name","addition_1")
    tanhLayer("Name","tanh_1")
    fullyConnectedLayer(MainBranch2_fourth_layer,"Name","fc_9","WeightsInitializer","he")
    dropoutLayer(Dropout,"Name","dropout_5")];
net = addLayers(net,tempNet);

tempNet = fullyConnectedLayer(MainBranch2_fourth_layer,"Name","fc_14","WeightsInitializer","he");
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
