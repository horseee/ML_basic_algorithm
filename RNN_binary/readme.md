## RNN Cell Implication
RNN cell的基本实现。

### 训练集
输入数据X：在时间t，<img src="https://latex.codecogs.com/gif.latex?X_t" />的值有50%的概率为1，50%的概率为0；  
输出数据Y：在时间t，<img src="https://latex.codecogs.com/gif.latex?Y_t" />的值有50%的概率为1，50%的概率为0，除此之外，还有两条规则：
* 规则1:如果<img src="https://latex.codecogs.com/gif.latex?X_{t-3}" /> == 1，<img src="https://latex.codecogs.com/gif.latex?Y_t"/>为1的概率增加50%
* 规则2:如果<img src="https://latex.codecogs.com/gif.latex?X_{t-8}" /> == 1，则<img src="https://latex.codecogs.com/gif.latex?Y_t"/>为1的概率减少25%， 如果上述两个条件同时满足，则<img src="https://latex.codecogs.com/gif.latex?Y_t" />为1的概率为75%。


### 预期loss
初始未训练时的loss在0.66左右，训练完成后在0.45左右

### 训练结果
设置每个cell中维数为4    
<img src = "state4.jpg" width="400" hegiht="300" />

设置每个cell中维数为16   
<img src = "state16.jpg" width="400" hegiht="300" />


