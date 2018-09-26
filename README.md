# digit-classification
Using MINST handwritten digit database to train a network via the multicategory perceptron training algorithm.

You will use the first n (n ≤ 60000) elements of training set images and training set labels to train our network via the multicategory perceptron training algorithm. Since the patterns are not linearly separable, the misclassification errors may not converge to 0 (unlike the last experiment in HW#1). You need to stop the iterations (epochs) when the ratio of misclassified input patterns falls below some threshold ε. The algorithm for this phase may thus be as follows:
• 0)Givenη,ε,n:
• 1) Initialize W ∈ R10×784 randomly.
• 2) Initialize epoch = 0.
• 3) Initialize errors(epoch) = 0, for epoch = 0, 1, . . .. • 3.1) Do
– 3.1.1) for i = 1 to n do (this loop is where we count the misclassification errors)
∗ 3.1.1.1) Calculate the induced local fields with the current training sample and weights: v = Wxi, where xi ∈ R784×1 is the ith training sample (the vectorized version of the
28 × 28 image from the training set images).
∗ 3.1.1.2) The given input image may result in multiple 1s on different output neurons (or
no 1s at all). For such scenarios, only for the purpose of calculating the misclassification errors, we choose the output neuron with the largest induced local field. In other words, we find the largest component of v = [v0 v1 · · · v9]T . Now, suppose that the largest component of v is vj , where j ∈ {0, . . . , 9}. Correspondingly, our network decides that the input image xi corresponds to the digit j.
∗ 3.1.1.3) If j is not the same as the input label (which is obtained from the training set labels), then errors(epoch) ← errors(epoch) + 1.
– 3.1.2) epoch ← epoch + 1.
– 3.1.3) for i = 1 to n do (this loop is where we update the weights)
∗ 3.1.3.1) W ← W + η(d(xi) − u(Wxi))xTi , where the step function u(·) is applied component-wise, and d(xi) ∈ R10×1 is the desired output for training sample xi (which is obtained from the training set labels). For example, if the label for xi is 3, then d(xi) = [0 0 0 1 0 0 0 0 0 0]T .
• 3.2) Loop to 3.1) if errors(epoch − 1)/n > ε.
(e) We now have some (hopefully) good weights that we have obtained via the multicategory PTA above. We now test the corresponding network on the test set images and test set labels. All we have to do is to use the loop 3.1.1) in the training algorithm:
• 0) Given W obtained from the multicategory PTA.
• 1) Initialize errors = 0.
• 2) for i = 1 to 10000 (note that there are 10000 test images)
– 2.1) Calculate the induced local fields with the current test sample and weights: v′ = Wx′i, where x′i ∈ R784×1 is the ith test sample (the vectorized version of the 28 × 28 image from the test set images).
– 2.2) Find the largest component of v′ = [v0′ v1′ · · · v9′ ]T . Suppose that the largest com- ponent of v′ is vj′, where j′ ∈ {0,...,9}.
– 2.3) If j′ is not the same as the input label (which is obtained from the test set labels), then errors ← errors + 1.
