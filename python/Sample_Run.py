# Sample run on BlogCatalog
import numpy as np
import pandas as pd
from scipy.sparse import csr_matrix

import utils
from eval import Precision_Np

if __name__ == '__main__':

    data = pd.read_csv('BlogCatalog.csv')      
    data = np.array(data) - 1                       # change index from 0
    N = np.max(np.max(data)) + 1
    A = csr_matrix((np.ones(data.shape[0]), (data[:,0],data[:,1])), shape = (N,N))
    A += A.T

    order = [1,2,3,-1]
    weights = []
    weights.append([1])
    weights.append([1,0.1])
    weights.append([1,0.1,0.01])
    weights.append([0.001])
    U_list,V_list = utils.AROPE(A,128,order,weights)
    # Network Reconstruction
    results = [Precision_Np(A,csr_matrix((N,N)),U_list[i],V_list[i],1e6) for i in range(4)]
    
    