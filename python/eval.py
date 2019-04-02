
import numpy as np

def Precision_Np(Matrix_test,Matrix_train,U,V,Np):
# Matrix_test is n x n testing matrix, may overlap with Matrix_train
# Matrix_train is n x n training matrix
# U/V are content/context embedding vectors
# Np: returns Precision@Np for pairwise similarity 
    N, _ = U.shape
    assert N < 30000, 'Network too large. Sample suggested.'
    Sim = U.dot(V.T)
    temp_row, temp_col = np.nonzero(Sim)
    temp_value = Sim[temp_row,temp_col]
    temp_choose = np.logical_and(np.array(Matrix_train[temp_row,temp_col])[0] == 0, temp_row != temp_col)
    temp_row, temp_col, temp_value = temp_row[temp_choose], temp_col[temp_choose], temp_value[temp_choose]
    temp_index = np.argsort(temp_value)[::-1]
    assert len(temp_index) >= Np, 'Np too large'  
    temp_index = temp_index[: int(Np)+1]
    temp_row, temp_col = temp_row[temp_index], temp_col[temp_index]
    result = np.array(Matrix_test[temp_row,temp_col])[0] > 0
    result = np.divide(np.cumsum(result > 0), np.array(range(len(result))) + 1)
    return result