function result = Precision_Np(Matrix_test,Matrix_train,U,V,Np)
% Matrix_test is n x n testing matrix, may overlap with Matrix_train
% Matrix_train is n x n training matrix
% U/V are content/context embedding vectors
% Np: returns Precision@Np for pairwise similarity 
[N,~] = size(U);
if (N > 30000)
    error('Network too large. Sample suggested.');
else
    Sim = U * V';
    [temp_row,temp_col,temp_value] = find(Sim);
    clear Sim;
end
temp_choose = (Matrix_train(sub2ind([N,N],temp_row,temp_col)) == 0) & (temp_row ~= temp_col);
temp_row = temp_row(temp_choose);
temp_col = temp_col(temp_choose);
temp_value = temp_value(temp_choose);
clear temp_choose;
[~,temp_index] = sort(temp_value,'descend');
if length(temp_index) < Np
    error('Np too large');
end
temp_index = temp_index(1:Np);
clear temp_value;
temp_row = temp_row(temp_index);
temp_col = temp_col(temp_index);
clear temp_index;
result = Matrix_test(sub2ind([N,N],temp_row,temp_col)) > 0;
result = cumsum(result > 0) ./ (1:length(result))';
end