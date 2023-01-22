A **neural network** is a massively parallel distributed processor tha has a natural propensity for:
* Storing experimental knowledge and 
* Making it available for use

Neural networks work similarly to brains. Knowledge is acquired by the network through a learning process, and knowledge is stored using interneuron connection strengths - or weights. 

Neural networks are primarily used for:
* Pattern recognition (Classification)
* Regression (Function approximation)

The learning process that a neural network goes through requires input data (the more the better). This process is called training. After training we can test ,**generalisation**. If the neural network can correctly predict / approximate.

#### Biological Neuron

A Biological neuron works as following:
* Input signals come from neighboring neurons 
* Each input signal have excitation or inhibition imposed on them by the synapses (this can be thought of a weight of 1 or 0)
* The recieving body sums all the incoming weighted signals
* If sufficient input is recieved (more than some threshhold, the neuron fires which is transmitted to the axion. If not, nothing happens.

### Early Neuron Model

A given node is given $n$ inputs from its predecessor nodes. These inputs are weighted (does not have to be 0 or 1 but anything in between) These inputs are summed up in the same way but the threshholding is done before summing up. This is done by including a bias $b_k$ which is a value added to the sum of inputs. The bias can also be represented as one of (typically the first) weights. 

After the summation, an **activation function** is used to introduce non linearity into the output, as well as limiting the amplitude of the output of a neuron.

For a neuron $k$:

$$
\begin{align}
y_k &= \phi (\Sigma^m_{j=1}w_{jk}x_j + b_k) \\
y_k &= \phi(v_k) 
\end{align}
$$
### Activation Functions

There are various types of activation functions for neural networks. Each one has it's own uses for different problems:

###### Threshhold / Hard Limiter

![[Pasted image 20221017145537.png]]

###### Piecewise linear function

Linear combiner within a certain range, then saturated to 0 or 1. For a high gradient of linear region, this becomes equivalent to the threshhold function.

![[Pasted image 20221017145608.png]]

###### Sigmoid

Sigmoid functions are continuous and differentiable everywhere.

![[Pasted image 20221017145637.png]]

Where $a$ is a tuning parameter which determines how close large/small outputs are to 1/0. 

###### Rectified Linear Unit (ReLU)

Output = 0 if input is negative.
Output = Input if input is positive.

![[Pasted image 20221017150241.png]]

###### Leaky ReLU

Prevents the output space being saturated with 0s when there are too many negative inputs. Leaky ReLU scales down the input if it is negative.

![[Pasted image 20221017150409.png]]

###### Linear 

Output is the same as input.

![[Pasted image 20221017150454.png]]

### Choice of Activation Function

There are three kinds of layers in a neural network, input, hidden and output:

![[Pasted image 20221017151653.png]]

Different activation functions are best suited for different layers. In the hidden layer it is common to use ReLU, leaky ReLU, tanh and log sigmoid activation functions. For output, the choice depends on the application and the data. For example for regression, output is usually cunconstrained and so the linear function works fine as a activation function.

### Differentiation of Activation Functions

To train a neural network we update the weights through optimisation - or minimisation of the cost function. This requires us to differentiare the cost function.


## Network Architecture

The format of a neural network consists of a single input layer, one or more hidden layers, and an output layer. Connections are only from left to right. A $n-m-l$ network is a network with a input layer consisting of $n$ nodes, a hidden layer of $m$ nodes and an output layer of $l$ nodes. 

##### Input layer
* Has no process carried out here (just passes signal to next layer)
* Not a design parameter - Number of nodes will be the same as a dimension of inputs.

##### Hidden Layer
* Design parameters include:
	* Number of hidden layers
	* Number of nodes in each hidden layer
	* Activation functions 
It has been proven that any bounded continuous function can be approximated using a single hidden layer. However the reason we use more layers is because in a multilayer network there is a smaller number of synampses weight, meaning there is less parameters to tune. However, the more layers the more local minima there are during training, which means that we may not find the best (global minimum) tuning values.

##### Output Layer
* Number of nodes is not a design parameter, it is fixed to the dimension of output.
* Activation parameters is a design parameter that depnds on the expected output.

## Perceptrons
A perceptron is the simplest form of neural network for classification patterns.

![[Pasted image 20221030170323.png]]

#### AND example
We aim to correctly classify the 2 dimensional input  {$x_1,x_2$} into class $C_1$ or $C_2$. 

The following perceptron is shown below, we want to find the bias $b$ and the weights $w_{k1}$ and $w_{k_2}$ such that given $x_1$ and $x_2$ the correct $y$ will be calculated. The output activation $\psi$   function used is the threshhold function.

![[Pasted image 20221030170801.png]]

Since this is a simple 2 dimensional problem, we can sketh the input output space:

![[Pasted image 20221030170853.png]]

The classes are linearly seperable (we can seperate the different outputs with a straight line) with the line:
$$
\begin{align}
x_2 = -x_1 + 1.5
\end{align}
$$
![[Pasted image 20221030171018.png]]

From this line equation we have:
$$
\begin{align}
&v = -x_1 - x_2 + 1.5 \text{ or}\\
&v = x_1 + x_2 - 1.5
\end{align}
$$
(This is done by re arranging the equation to make it equal to zero) From this we know that our bias is either 1.5 or -1.5.

By substituting $x_1 = x_2 = 0$ into each of the equations we can see that the first equation gives 1.5, and $\psi(1.5) = 1$  which is not the correct answer since $0\land 0 = 0$. The second equation gives -1.5, and $\psi(-1.5) = 0$ which is correct, so our bias must be -1.5.

This result gives the following perceptron:

![[Pasted image 20221030172742.png]]

##### Learning Method

The perceptron now needs to be trained using a **learning procedure**. Learning procedures consist of:
* A training set of input output vectors - (example data)
* The weight vector to be tuned in such a way so that the best classification of the training vectors is achieved.
The input vector is:
$$
\begin{align}
x^\prime(t) = [1, x_1(t), x_2(t),...,x_m(t)]^T 
\end{align}
$$
The weight vector is:
$$
\begin{align}
w^\prime(t) = [b(t), w_1(t), w_2(t),...,w_m(t)]^T
\end{align}
$$
Where $t$ represents the iteration step. The immediate output (before the hard limiter) is:
$$
\begin{align}
v(t) = w^{\prime T} \cdot x^{\prime T}
\end{align}
$$

The equation $w^{\prime T} \cdot x^{\prime T} = 0$ plotted in an $m$ dimensional space with coordinates $x_1,x_2,...,x_m$ defines a hyperplane which seperates the two classes, which when combined with the threshhol function we get:

$$
\begin{align}
w^{\prime T} \cdot x^{\prime T} \geq 0 \to \text{ Class 1}\\
w^{\prime T} \cdot x^{\prime T} \lt  0 \to\text{ Class 0}
\end{align}
$$

##### Algorithm
* Choose random starting weight vector $w^\prime(0)$.
* Let t = 1
* While there exsists input vectors that are wrongly classified by $w^\prime(t-1)$, do:
	* If $x^\prime$  is a misclassified input vector, update the weight vector to:
	* $w^\prime(t) = w^\prime(t-1) + \eta(d-y)x^\prime$
	* Where $\eta > 0$ is the learning rate, $d$ is the desired output and $y$ is the network output.
	* Increment $t$
Each $t$ is called an epoch and an epoch is ocmpleted after each of the input vectors 

Small values of $\eta$ results in a slower learning rate whilst high learning rates can undo progress of previous learnings.

## Multilayer Perceptrons
Regular perceptrons can only classify two classes which are linearlly seperable. For problems like classifying XOR, we need multi layer perceptrons.

#### XOR Problem

The input-output space of the XOR porblem looks like this:

![[Pasted image 20221030190959.png]]

This problem would require multiple perceptrons working together.

![[Pasted image 20221030191240.png]]

The above example solves the XOR problem. Multilayer perceptrons consist of the layers specified here [[#Network Architecture|here]].