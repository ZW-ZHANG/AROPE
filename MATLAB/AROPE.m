function [U_output, V_output] = AROPE(A,d,order,weights)
% AROPE Algortihm
% Inputs: 
% A: adjacency matrix A or its variations
% d: dimensionality 
% r different high-order proximity:
    % order: 1 x r vector, order of the proximity
    % weights: 1 x r cell, each containing the weights for one high-order proximity
% Outputs: 1 x r cell, each containing the embedding vectors 
[lambda,X] = Eigen_TopL(A,d);
r = length(order);
U_output = cell(r,1);
V_output = cell(r,1);
for i = 1:r
    [U_output{i},V_output{i}] = Shift_Embedding(lambda,X,order(i),weights{i},d);
end

end