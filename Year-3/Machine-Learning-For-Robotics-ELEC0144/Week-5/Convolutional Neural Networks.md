Methods of classification such as edge detection and pattern matching (matching certain features such as a dogs ears) tend to be in effective as they either are not robust against variations or they require too much human intervention. So we use CNNs to learn how to recognise images without any human identification. 

We often need **datasets** to test and train are dataset. Rather than gathering them ourselves we can just use well known data sets. As an example, **Image net** is a popular data set that contains 1000 classes with 1.3 million training images. 

## MLP For Image Classification

As input to our network we give in the image. This will be in a single row vector, consisting of all the pixel values of the image. So a 32x32 RGB image will consist of a 1x3072 row vector $(3\times 32 \times 32 = 3072)$. The network can then be created as specified in [[Multilayer Perceptrons and Backpropagation Algorithm|here]]. The learning process is complete after a certain accuracy is reached.

$$
\begin{align}
\text{Accuracy} = \frac{\text{Number of correctly classified images}}{\text{Total number of images}}
\end{align}
$$
However, since the input vector is of the size 3072, the number of weights will increase very quickly. We also lose the spatial property (information about the surrounding pixels) after flattening the image into a single row.

## Convolutional Neural Networks

CNNs are based of the idea that certain parts of the brain are activated after seeing certain patterns. A CNN consists of several layers:
* Convolution Layer
* ReLU layer
* Pooling layer
* Connected layers ([[Multilayer Perceptrons and Backpropagation Algorithm||MLP]])

Convolution layers are always followed by a ReLU layer and typically you have a pooling layer at the end followed by the MLP.

#### Convolution Layer
The convolution layer takes multiple pixels in a surrounding area and performs an elementwise multiplication of pixels with a mask, similar to in [[Image-Processing#Pixel Group Processing|pixel point processing]]. This is primarily used to detect edges. Multiple filters can be applied and stacked together to detect different kind of edges (horizontal, vertiacal):

![[Pasted image 20221031144502.png]]

![[Pasted image 20221031144516.png]]

The same idea applies for RGB images, but the filter is applied on all three of the layers. Each layer is known as a **channel**
![[Pasted image 20221031144623.png]]

The filter weights are initially random but are tuned using [[Multilayer Perceptrons and Backpropagation Algorithm|back propagation]] (the same filter is used on the entire image). Typically the first layer will be applying filters to find low level features like edges and later layers try to find combinations of these features to find more complicated patterns.

To prevent the shrinking issue which occurs during this process we can add a padding to the outer perimiter of the image. We can also alter the **stride** of the image which is how many pixels across we move the filter. This will further shrink the image and will reduce the size of the activation map.

#### ReLU Layer 
After completing the convolution we can then pass the activation maps through the **ReLU* layer**. This applies the [[Introduction to Neural Networks#Rectified Linear Unit (ReLU)|ReLU]] filter on every single filter. There is no learning filter in this layer.

### Pooling Layer
The two previous layers encode the exact position of the features found in the input. This means that small movements of features in the input will change the feature map. To fix this the **pooling layer** will provide an operation on a group of pixels to find a number to represent that group. For example max pooling works as follows:

![[Pasted image 20221031150401.png]]
There are also other pooling types such as **max pooling, average pooling, etc**.

Pooling layer has no learnable parameters, the only hyperparameter (parameters changed using trial and error) is the type of pool function.

Combining all these layers give:
![[Pasted image 20221031150616.png]]

The amount of channels in the filter needs to match the channels in the input. All the above layers followed by the MLP is called a **fully connected layer**.

## Improving CNN
There are several techniques to improve the training of a CNN:
* Batch normalization
* Data Augmentation
* Learning Rate Schedule

### Batch Normalisation
In batch normalization we split the images into groups and operate on thos batches.
* Calculate the mean and variance of each pixel in each image in a minibatch
$$
\begin{align}
\hat{x}_{i,j}=\frac{x_{i,j}-\mu}{\sqrt{\sigma^2_j + \epsilon}}
\end{align}
$$
* Calculate the normalized output
$$
\begin{align}
y_{i,j} = \gamma_j\hat{x}_{i,j} + \beta_j
\end{align}
$$
	Where the learnable parameters $\gamma_j$ scales the standard deviation and $\beta_j$ shifts the man.

### Data Augmentation
Data augmentation is a technique used to reduce overfitting when training an CNN. This can be done by changing the images being trained on so the network learnes to recognize images in a variety of different scenarios. For example you could rotate the image or increase the saturation.

### Learning Rate Schedule
We can change the learning rate as the epoch increases, which can speed up the learning process.