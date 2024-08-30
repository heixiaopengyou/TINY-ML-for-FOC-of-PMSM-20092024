function X = preprocessMiniBatchPredictors(dataX)
    
    X = cell2mat(dataX);
    X = reshape(X, [3, size(X, 1)])'; % This should ensure the output is 1x3
    
    % Convert to a dlarray with the format "CB" (Channel, Batch)
    X = dlarray(X', "CB");
end
