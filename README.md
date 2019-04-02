# AROPE
This is the official implementation of "[Arbitrary-Order Proximity Preserved Network Embedding](http://cuip.thumedialab.com/papers/NE-ArbitraryProximity.pdf)"(KDD 2018).

We provide two implementations: MATLAB and Python. Note that the MATLAB version is faster in our testing and is used in producing original results in the paper.

### Requirements
```
MATLAB R2017a
or 
Python >= 3.5.2
numpy >= 1.14.2
scipy >= 1.0.0
pandas >= 0.22.0
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
    weights: 1 x r cell/list, each containing the weights for one high-order proximity
Output:
    U_output/V_output: 1 x r cell/list, each containing one content/context embedding vectors 
```
#### Example Usage
See SampleRun.m or SampleRun.py for a sample run of network reconstruction on BlogCatalog dataset

### Cite
If you find this code useful, please cite our paper:
```
@inproceedings{zhang2018arbitrary,
  title={Arbitrary-Order Proximity Preserved Network Embedding},
  author={Zhang, Ziwei and Cui, Peng and Wang, Xiao and Pei, Jian and Yao, Xuanrong and Zhu, Wenwu},
  booktitle={Proceedings of the 24th ACM SIGKDD International Conference on Knowledge Discovery \& Data Mining},
  pages={2778--2786},
  year={2018},
  organization={ACM}
}
```