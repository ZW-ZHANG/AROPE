# AROPE
This is a sample implementation of "[Arbitrary-Order Proximity Preserved Network Embedding](http://git.thumedialab.com/embedding/AROPE/raw/master/KDD18AROPE.pdf)"(KDD 2018).

### Requirements
```
MATLAB R2017a
``` 

### Usage
#### Main Function
```
[U_output, V_output] = AROPE(A,d,order,weights)
```
```
Input:
    A: sparse adjacency matrix or its variations, must be symmetric
    d: dimensionality 
    order: 1 x r vector, order of the proximity
    weights: 1 x r cell, each containing the weights for one high-order proximity
Output:
    U_output/V_output: 1 x r cell, each containing one content/context embedding vectors 
```
#### Example Usage
See SampleRun.m for a sample run of network reconstruction on BlogCatalog dataset

### Cite
If you find this code useful, please cite our paper:
```
@inproceedings{zhang2018arbitrary,
  title={Arbitrary-Order Proximity Preserved Network Embedding},
  author={Zhang, Ziwei and Cui, Peng and Wang, Xiao and Pei, Jian and Yao, Xuanrong and Zhu, Wenwu},
  booktitle={Proceedings of the 24th ACM SIGKDD International Conference on Knowledge Discovery and Data Mining},
  year={2018},
  organization={ACM}
}
```