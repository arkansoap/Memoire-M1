# Models studies : 

## Linear Discriminant Ananlysis : ( Voir cours de Mr Piller)

- **definition** : Linear discriminant analysis (LDA), normal discriminant analysis (NDA), or discriminant function analysis is a generalization of Fisher's linear discriminant, a method used in statistics and other fields, **to find a linear combination of features that characterizes or separates two or more classes of objects or events.** [Lien Wikipedia](https://en.wikipedia.org/wiki/Linear_discriminant_analysis)

- On cherchera un axe qui tend à maximiser la variance inter classes et à minimiser la variance intra classe.

- Extrait du cours de Mr Piller :

<img src="img/FDA1.png" width="50%" height="50%">

- Roots of LDA : Fisher(1936) and Wells(1939)

    * wells approach (from Max kun's book):

    <img src="img/WelchApproach.png" width="50%" height="50%">

    > Since a single predictor is used for this example, it belies the complexity of
    using Bayes’ Rule in practice. For classiﬁcation, the number of predictors is
    almost always greater than one and can be extremely large. In more realistic
    situations, how does one compute quantities such as $P_r[X | Y = C ]$ in many
    dimensions? What multivariate probability distributions can be used to this eﬀect?
    
    * Fishers approache:

    > Fisher formulated the classiﬁcation problem in a diﬀerent way. In this approach, he sought to ﬁnd the linear combination of the predictors such that the between-group variance was maximized relative to the within-group variance. In other words, he wanted to ﬁnd the combination of the predictors that gave maximum separation between the centers of the data while at the same time minimizing the variation within each group of data.

- Difference beetween LDA and PCA : [explanation with graphics here](https://sebastianraschka.com/faq/docs/lda-vs-pca.html)

- Difference entre LDA et QDA : QDA is a non linear discriminant analysis (quadratic)

> Dans l’analyse factorielle discriminante, en anglais linear discriminant analysis, nous avons supposé que chaque classe possédaient une distribution gaussienne avec une moyenne spécifique, mais une matrice des variances covariances commune Σ. L’analyse discriminante quadratique propose une approche alternative. Comme pour la LDA, on suppose que les distributions dans chacune des classes sont gaussiennes, mais qu’elles n’ont pas forcément une matrice des variances covariances communes.

## Logistic Regression ( Voir cours Mr kossi)

- **Definition** : In statistics, the logistic model (or logit model) is used to model the probability of a certain class or event existing such as pass/fail, win/lose, alive/dead or healthy/sick. This can be extended to model several classes of events such as determining whether an image contains a cat, dog, lion, etc. Each object being detected in the image would be assigned a probability between 0 and 1, with a sum of one. Logistic regression is a statistical model that in its basic form uses a logistic function to model a binary dependent variable, although many more complex extensions exist. In regression analysis, logistic regression (or logit regression) is estimating the parameters of a logistic model (a form of binary regression). [Lien Wikipedia](https://en.wikipedia.org/wiki/Logistic_regression#:~:text=Logistic%20regression%20is%20a%20statistical,a%20form%20of%20binary%20regression)

- [Conseil vidéo de PE](https://www.youtube.com/watch?v=9zw76PT3tzs)

- from max kuhn's book :

<img src="img/log.png" width="50%" height="50%">

## K-nearest neighboors (cours Mme scholler)

- **Definition** : In k-NN classification, the output is a class membership. An object is classified by a plurality vote of its neighbors, with the object being assigned to the class most common among its k nearest neighbors (k is a positive integer, typically small). If k = 1, then the object is simply assigned to the class of that single nearest neighbor. [Lien wikipedia](https://en.wikipedia.org/wiki/K-nearest_neighbors_algorithm)

- From MAx kuhn's book :

<img src="img/KNN.png" width="50%" height="50%">

in the K-nearest neighbor classiﬁcation model, a new sample is predicted based on the K-closest data points in the training set. 

## Support Vector Machine

 - **definition**: There are many hyperplanes that might classify the data. One reasonable choice as the best hyperplane is the one that represents the largest separation, or margin, between the two classes. So we choose the hyperplane so that the distance from it to the nearest data point on each side is maximized. If such a hyperplane exists, it is known as the maximum-margin hyperplane and the linear classifier it defines is known as a maximum-margin classifier; or equivalently, the perceptron of optimal stability.
 
 More formally, a support-vector machine constructs a hyperplane or set of hyperplanes in a high- or infinite-dimensional space, which can be used for classification, regression, or other tasks like outliers detection. Intuitively, a good separation is achieved by the hyperplane that has the largest distance to the nearest training-data point of any class (so-called functional margin), since in general the larger the margin, the lower the generalization error of the classifier.[Lien wikipedia](https://en.wikipedia.org/wiki/Support-vector_machine)

 the original problem may be stated in a finite-dimensional space, it often happens that the sets to discriminate are not linearly separable in that space. For this reason, it was proposed[5] that the original finite-dimensional space be mapped into a much higher-dimensional space, presumably making the separation easier in that space

 - The support vector machines create an optimum hyperplane that separates the training data by the maximum margin. However, sometimes we would like to allow some misclassifications while separating categories. **The SVM model has a cost function, which controls training errors and margins**. For example, a small cost creates a large margin (a soft margin) and allows more misclassifications. On the other hand, a large cost creates a narrow margin (a hard margin) and permits fewer misclassifications. In this recipe, we will illustrate how the large and small cost will affect the SVM classifier.

 - Concerning the gamma value in the SVM, gamma says how far the 'reach' of each training example is (http://scikit-learn.org/stable/auto_examples/svm/plot_rbf_parameters.html), but can be just thought of as a regularization parameter. The higher the gamma, the more local the reach, and you have to watch out that your model keeps a general behavior since it is prone to adjust too much to the training examples.

<img src="img/svm.png" width="30%" height="30%">

- *Hard margin* : If the training data is linearly separable and *soft margin* to cases in which the data are not linearly separable

- [Choice of kernel option](https://data-flair.training/blogs/svm-kernel-functions/#:~:text=SVM%20Kernel%20Functions,it%20into%20the%20required%20form.&text=These%20functions%20can%20be%20different,(RBF)%2C%20and%20sigmoid.) 

## Basic Classification Trees (voir cours de Mme Scholler)

Tree-based models consist of one or more nested if-then statements for the predictors that partition the data. Within these partitions, a model is used to predict the outcome. For example, a very simple tree could be deﬁned as :

    if Predictor A >= 1.7 then

        | if Predictor B >= 202.1 then Outcome = 1.3

        | else Outcome = 5.6

    else Outcome = 2.5

In this case, two-dimensional predictor space is cut into three regions (or terminal nodes) and, within each region, the outcome categorized into either “Class 1” or “Class 2.” Figure 14.1 presents the tree in the predictor space. Just like in the regression setting, the nested if-then statements could be collapsed into rules such as

    if Predictor A >= 0.13 and Predictor B >= 0.197 then Class = 1
    if Predictor A >= 0.13 and Predictor B < 0.197 then Class = 2
    if Predictor A < 0.13 then Class = 2

<img src="img/tree.png" width="30%" height="30%">

## Random Forest (voir cours de Mme Scholler)

 - [introduction to rf](https://www.youtube.com/watch?v=D_2LkhMJcfY)

 - parameters : 
    - mtry : number of variables randomy sampled at each split 
    - ntree : number of tree to grow
    - nodesize : minimum number of observation in a terminal node. setting it lower heads to trees with a larger depth which means that more splits are performed until the  terminal nodes. (default value is 1 for classification and 5 for regression -diaz urirarte and de andres 2006).

## Boosting (voir cours de Mme Scholler)

