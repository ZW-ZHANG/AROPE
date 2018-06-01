% Refer to AROPE.m for details

% A sample run is as follows:

edge_list = load('BlogCatalog.csv');
A = sparse(edge_list(:,1),edge_list(:,2),1,max(max(edge_list)),max(max(edge_list)));
A = A + A';
order = [1,2,3,-1];
weights = cell(4,1);
weights{1} = 1;
weights{2} = [1,0.1];
weights{3} = [1,0.1,0.01];
weights{4} = 0.001;
[U_cell,V_cell] = AROPE(A,128,order,weights);
% Network Reconstruction
for i = 1:4
    results = Precision_Np(A,sparse(max(max(edge_list)),max(max(edge_list))),U_cell{i},V_cell{i},1e6);
    figure(i);
    semilogx(1:1e6,results);
end