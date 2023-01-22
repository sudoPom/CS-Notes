**Optimisation** can be carried out by minimising the sum of squared errors of each of the weights. For example, if we are trying to clasify this graph:
![[Pasted image 20221030192126.png]]

The $SSE$ can be calculated as follows

$$
\begin{align}
SSE &= e_1^2 + e_2^2 + ... + e_n^2\\
&= (d_1-y_1)^2 + ... + (d_n-y_n)^2\\
&= (d_1 - w_1x_1 - w_0)^2 + ... + (d_n - w_1x_n - w_0)^2
\end{align}
$$

We can then minimise this result through the use of differentiation. Which gives us the following:
$$
\begin{align}
&w_0=(t+1) = w_0(t) - \eta\frac{\partial(SSE)}{\partial(w_0)}\\
&\text{and} \\
&w_1=(t+1) = w_1(t) - \eta\frac{\partial(SSE)}{\partial(w_1)}
\end{align}
$$
Where $\eta$ is the learning rate. This then gives us:

$$
\begin{align}
&w_0(t+1) = w_0(t) - \eta[-2(d_1 - w_1x_1 - w_0) - ... - 2(d_n - w_1x_n - w_0)]\\ &\text{and} \\
&w_1(t+1) = w_1(t) - \eta[-2(d_1 - w_1x_1 - w_0)x_1 - ... - 2(d_n - w_1x_n - w_0)x_n]
\end{align}
$$
This is an iterative process and will therefore need to be done multiple times. The stopping condition is typically a small value representing the difference between the networks results and the actual results. At the end of testing the values would give a best-fit line.

### Sequential Steepest Decent
Described above is the **batch mode**, where all the data points are processed in calculating new weights. Another mode is **sequential mode** where weights are updated at each data point. This is better in cases where there is a lot of data.

![[Pasted image 20221030194709.png]]

In sequential mode, since we work with a single data point, we calculate the instantaneous squared error, rather than the sum of squared errors.

$$
\begin{align}
E(w,i) = \frac{1}{2}e(i)^2
\end{align}
$$

For example:

$$
\begin{align}
E(w,i) &= \frac{1}{2}e(i)^2 \\ 
&= \frac{1}{2}(d_i - w_1x_i - w_0)^2
\end{align}
$$
The weights are then updated as follows:
$$
\begin{align}
w_0(t+1) &= w_0(t) - \eta\frac{\partial(E)}{\partial(w_0)} \\ 
&= w_0(t) + \eta(d_i - w_1x_i - w_0)\\
&= w_0(t) + \eta e(i)\\

w_1(t+1) &= w_0(t) - \eta\frac{\partial(E)}{\partial(w_1)} \\ 
&= w_1(t) + \eta(d_i - w_1x_i - w_0)x_i\\
&= w_1(t) + \eta e(i)x_i
\end{align}
$$

This is known as **stochastic gradient decent**.

### Minibatch

A **minibatch** lies directly in between the batch and sequential modes. It works by splitting the data points into "minibatches" and updating the weights on each minibatch.

### Loss and Cost
The **loss function** ($L$) is defined with respect to one single training example whilst the **cost function** ($J$) is the average loss function of the entire training set. For example we could have a loss function be the square of errors. We would then have:

$$
\begin{align}
&L(i) = e(i)^2 = (d(i)-y(i))^2\\
&J = \frac{1}{n}\Sigma^n_{i=1}(L(i)) = \frac{1}{n}\Sigma^n_{i=1}(d(i) - y(i))^2
\end{align}
$$
For **binary classification** (class 0, class 1) another commonly used loss function is the **binary cross-entropy**:
$$
\begin{align}
&L(i) = -[d(i)\log(y(i)) + (1-d(i))\log(1-y(i))] \\ 
&J = -\frac{1}{n}\Sigma^n_{i=1}[d(i)\log(y(i)) + (1-d(i))\log(1-y(i))]
\end{align}
$$
 If there are more than 2 classes we can calculate seperate **cross-entropy** loss for each class and sum the results:
 $$
\begin{align}
L(i) = -\Sigma^{\text{\#classes}}_{\text{class=1}}[d_{class}(i)\log(y_{class}(i))]
\end{align}
$$

## Backpropagation 

Backpropagation is the process of training a neural network. The weights are initially randomly generated. The weights are first used in a forward pass in the neural network, left to right.

![[Pasted image 20221031162555.png]]

The output of the network $y$ is compared with the desired output $d$ and the loss/cost function is calculated. The weights are then iteratively updated until the lostt/cost function is minimized. The algorithm is called back propagation as we update the weights from the last layer to the first hidden layer.

For the $m^{th}$ weight in the $n^{th}$ layer connecting to the $i^{th}$ node in the next layer we label the corresponding weight as:
$$
\begin{align}
w^{(n)}_{mi}
\end{align}
$$
Whereas an output value is labeled as:
$$
\begin{align}
x^{(n)}_{output,m}
\end{align}
$$
The instantaneous squared errors of all outputs for one instance of data is:
$$
\begin{align}
&L = \frac{1}{2}(d_1-y_1)^2 + \frac{1}{2}(d_2-y_2)^2 + ... + \frac{1}{2}(d_{m3}-y_{m3})^2\\
\end{align}
$$
For a network with $m3$ layers

#### Output layer

To update the output layer weights we first write the loss function in terms of ouput layer weights:

$$
\begin{align}
L = \frac{1}{2}(d_1 - \psi^{(3)}(v_1^{(3)}))^2 + \frac{1}{2}(d_2 - \psi^{(3)}(v_1^{(3)}))^2 + ... + \frac{1}{2}(d_{m2} - \psi^{(3)}(v_{m2}^{(3)}))^2
\end{align}
$$
Where each $v$ is the sum of each of the weighted inputs for instance:
$$
\begin{align}
v_1^{(3)} = w_{11}^{(3)}x^{(2)}_{out,1} + w_{21}^{(3)}x^{(2)}_{out,2} + ... + w_{m21}^{(3)}x^{(2)}_{out,m2}
\end{align}
$$
We can then use the method of steepest descent to find the new weights by calculating the following for each weight ($w^{(3)}_{21}$ for example):

$$
\begin{align}
	w^{(3)}_{21 \text{ new}} &= w^{(3)}_{21 \text{ old}} - \eta^{(3)}\frac{\partial(L)}{\partial(w^{(3)}_{21})}\\
	&= w^{(3)}_{21 \text{ old}} - \eta^{(3)}\frac{\partial(L)}{\partial(v^{(3)}_{1})}\cdot \frac{\partial(v^{(3)}_{1})}{\partial(w^{(3)}_{21})} \text{ using the chain rule} \\
\end{align}
$$
$\frac{\partial(v^{(3)}_{1})}{\partial(w^{(3)}_{21})}$ can be found out easily since:
$$
\begin{align}
v_{1}^{(3)} = w_{11}^{(3)}x^{(2)}_{out,1} + w_{21}^{(3)}x^{(2)}_{out,2} + ... 
\end{align}
$$
However $\frac{\partial(L)}{\partial(v^{(3)}_{1})}$ needs to be found using the chain rule again.
$$
\begin{align}
&L = \frac{1}{2}(d_1 - \psi^{(3)}(v_1^{(3)}))^2 + \frac{1}{2}(d_2 - \psi^{(3)}(v_2^{(3)}))^2 + ...\\
&\frac{\partial(L)}{\partial(v^{(3)}_{1})} = -(d_1 - \psi^{(3)}(v_1^{(3)})\frac{\partial(\psi)}{\partial(v_1^{(3)})}) \triangleq -\delta_1^{(3)} \text{ This is for the error of the first output node}
\end{align}
$$
Therefore:
$$
\begin{align}
w_{21,new}^{(3)} = w_{21,old}^{(3)} + \eta^{(3)}\delta_1^{(3)} \cdot x^{(2)}_{out,2}
\end{align}
$$
Similarly, for all other weights in the output layer we have:
$$
\begin{align}
w_{ij,new}^{(3)} = w_{ij,old}^{(3)} + \eta^{(3)}\delta_j^{(3)} \cdot x^{(2)}_{out,i}
\end{align}
$$
Where:
$$
\begin{align}
\delta_{j}^{(3)} = (d_j-\psi^{(3)}(v^{(3)}_j))\frac{\partial\psi^{(3)}}{\partial v^{(3)}_j} \text{ Error output for the jth node}
\end{align}
$$
This is the local gradient for the $j^{th}$ node. 

#### Hidden Layers
The hidden layers can be derived in the same way that the output layer is done. The idea works as follows:
* Express the loss function in terms of output layer weights
* Express the inputs of the output layer in terms of hidden layer weigths
* The derivatives can be obtained by the chain rule.

Starting with the loss function:
$$
\begin{align}
&L = \frac{1}{2}(d_1-y_1)^2 + \frac{1}{2}(d_2-y_2)^2 + ... + \frac{1}{2}(d_{m3}-y_{m3})^2\\
\end{align}
$$
Substituting the output layer weights:

$$
\begin{align}
L = \frac{1}{2}(d_1 - \psi^{(3)}(v_1^{(3)}))^2 + \frac{1}{2}(d_2 - \psi^{(3)}(v_1^{(3)}))^2 + ... + \frac{1}{2}(d_{m2} - \psi^{(3)}(v_{m2}^{(3)}))^2
\end{align}
$$
The $v$'s are:

$$
\begin{align}
&v_{1}^{(3)} = w_{11}^{(3)}x^{(2)}_{out,1} + w_{21}^{(3)}x^{(2)}_{out,2} + ... + w_{m2m3}^{(3)}x^{(2)}_{out,m2}\\
&v_{m3}^{(3)} = w_{1m3}^{(3)}x^{(2)}_{out,1} + w_{2m3}^{(3)}x^{(2)}_{out,2} + ... + w_{m2m3}^{(3)}x^{(2)}_{out,m2}
\end{align}
$$
We then continue to express terms using weights/signals of the 2nd hidden layer:

$$
\begin{align}
x_{out,1}^{(2)} = \psi^{(2)}(v_1^{(2)}) \text{ with } v_1^{(2)} &= w_{11}^{(2)}x^{(1)}_{out,1} + w_{21}^{(2)}x^{(1)}_{out,2} +  ... + w_{m11}^{(1)}x^{(1)}_{out,m1}\\ 
x_{out,2}^{(2)} = \psi^{(2)}(v_2^{(2)}) \text{ with } v_2^{(2)} &= w_{12}^{(2)}x^{(1)}_{out,1} + w_{22}^{(2)}x ^{(1)}_{out,2} +  ... + w_{m12}^{(1)}x^{(1)}_{out,m1}\\ &\vdots \\
x_{out,m2}^{(2)} = \psi^{(2)}(v_{m2}^{(2)}) \text{ with } v_{m2}^{(2)} &= w_{1m2}^{(2)}x^{(1)}_{out,1} + w_{2m2}^{(2)}x^{(1)}_{out,2} +  ... + w_{m1m2}^{(1)}x^{(1)}_{out,m1}\\
\end{align}
$$

^9031fa


Again taking $W_{21}$ as an example:
$$
\begin{align}
w_{21,new}^{(2)} = w_{21,old} - \eta^{(2)}\frac{\partial L}{\partial{w_{21}^{(2)}}} 
\end{align}
$$
Using the [[Multilayer Perceptrons and Backpropagation Algorithm#^9031fa|previous]] equations we can see that:
* $w^{(2)}_{21}$ appears in the $v^{(2)}_1$ equation.
* $v^{(2)}_1$ appears in the $x^{(2)}_{out,1}$ equation
* $x^{(2)}_{out,1}$ appears in the $v^{(3)}_1, v^{(3)}_2, ..., v^{(3)}_{m3}$ equations.
* $v^{(3)}_1, v^{(3)}_2, ..., v^{(3)}_{m3}$ appears in the $L$ equation

Therefore we have:
$$
\begin{aligned}
\frac{\partial L}{\partial\left(w_{21}^{(2)}\right)} &=\frac{\partial L}{\partial\left(v_{1}^{(3)}\right)} \cdot \frac{\partial\left(v_{1}^{(3)}\right)}{\partial\left(x_{\text {out }, 1}^{(2)}\right)} \cdot \frac{\partial\left(x_{\text {out }, 1}^{(2)}\right)}{\partial\left(v_{1}^{(2)}\right)} \cdot \frac{\partial\left(v_{1}^{(2)}\right)}{\partial\left(w_{21}^{(2)}\right)}+\frac{\partial L}{\partial\left(v_{2}^{(3)}\right)} \cdot \frac{\partial\left(v_{2}^{(3)}\right)}{\partial\left(x_{\text {out }, 1}^{(2)}\right)} \cdot \frac{\partial\left(x_{\text {out }, 1}^{(2)}\right)}{\partial\left(v_{1}^{(2)}\right)} \cdot \frac{\partial\left(v_{1}^{(2)}\right)}{\partial\left(w_{21}^{(2)}\right)} \\

&+\cdots+\frac{\partial L}{\partial\left(v_{m 3}^{(3)}\right)} \cdot \frac{\partial\left(v_{m 3}^{(3)}\right)}{\partial\left(x_{\text {out }, 1}^{(2)}\right)} \cdot \frac{\partial\left(x_{\text {out }, 1}^{(2)}\right)}{\partial\left(v_{1}^{(2)}\right)} \cdot \frac{\partial\left(v_{1}^{(2)}\right)}{\partial\left(w_{21}^{(2)}\right)}
\end{aligned}
$$
$$

=\left(\begin{array}{c}

\frac{\partial L}{\partial\left(v_{1}^{(3)}\right)} \cdot \frac{\partial\left(v_{1}^{(3)}\right)}{\partial\left(x_{\text {out }, 1}^{(2)}\right)}+\frac{\partial L}{\partial\left(v_{2}^{(3)}\right)} \cdot \frac{\partial\left(v_{2}^{(3)}\right)}{\partial\left(x_{o u t, 1}^{(2)}\right)} \\

+\frac{\partial L}{\partial\left(v_{m 3}^{(3)}\right)} \cdot \frac{\partial\left(v_{m 3}^{(3)}\right.}{\partial\left(x_{o u t, 1}^{(2)}\right)}

\end{array}\right) \cdot \frac{\partial\left(x_{\text {out }, 1}^{(2)}\right)}{\partial\left(v_{1}^{(2)}\right)} \cdot \frac{\partial\left(v_{1}^{(2)}\right)}{\partial\left(w_{21}^{(2)}\right)}

$$
Some of these values have already been calculated from updating the output layer:
$$
\begin{align}
\frac{\partial L}{\partial(v_1^{(3)})} &= -\delta_1^{(3)}\\
\frac{\partial L}{\partial(v_2^{(3)})} &= -\delta_2^{(3)}\\
&\vdots\\
\frac{\partial L}{\partial(v_{m3}^{(3)})} &= -\delta_{m3}^{(3)}\\
\end{align}
$$

Next we have:
$$
\begin{align}
\frac{\partial(v_1^{(3)})}{\partial(x^{(2)}_{out,1})} &= w_{11}^{(3)}\\
\frac{\partial(v_2^{(3)})}{\partial(x^{(2)}_{out,1})} &= w_{12}^{(3)}\\
&\vdots\\
\frac{\partial(v_{m3}^{(3)})}{\partial(x^{(2)}_{out,1})} &= w_{1m3}^{(3)}
\end{align}
$$

