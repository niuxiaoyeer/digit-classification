# digit-classification

#### Using MINST handwritten digit database to train a network via the multicategory perceptron training algorithm.

###
* Each image is 28×28, so that we will have a neural network 28×28 = 784 nodes in the input layer, and 10 nodes in the output layer. We will ignore the biases. We wish to find 784 × 10 = 7840 weights such that the network outputs [1 0 0 · · · 0]T if the input image corresponds to a 0, [0 1 0 ··· 0]T if the input image corresponds to a 1, and so on.

* I used the first n (n ≤ 60000) elements of training set images and training set labels to train our network via the multicategory perceptron training algorithm. Since the patterns are not linearly separable, the misclassification errors might not converge to 0. So I need to stop the iterations (epochs) when the ratio of misclassified input patterns falls below some threshold ε.

* I had some (hopefully) good weights that we have obtained via the multicategory PTA above. Then I tested the corresponding network on the test set images and test set labels.
