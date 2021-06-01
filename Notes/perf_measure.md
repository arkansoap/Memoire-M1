# Measure of performance of applied models :

## accuracy

accuracy not a good indicators in case of imbalanced model because if we predict only 0 , we will have a bigger accuracy!!!

## Lift curves: 

- [définition wikipédia](https://en.wikipedia.org/wiki/Lift_(data_mining)?oldid=408604573)

## Courbe ROC:

Visualization of the trade off between benefits($TP_{rate}$) and costs ($FP_{rate}$)

- [a link to the french articles from wikipedia](https://fr.wikipedia.org/wiki/Courbe_ROC)

- AUC : Aera under the roc curve

## Kappa : Cohen 1960

kappa formula and definition : 

 > The Kappa statistic (also known as Cohen’s Kappa) was originally designed to assess the agreement between two raters (Cohen 1960). Kappa takes into account the accuracy that would be generated simply by chance. (wikipedia)
 
the kappa can range from -1 to +1 

$$ K = \frac{Pr(a) - Pr(e)}{1 - Pr(e)}$$
Where $Pr(a)$ represents the actual observed agree-ment, and $Pr(e)$ represents chance agreement. We calculate this two ratio with the confusion matrix. 

- [a link from wikipedia explainig kappa coefficient](https://en.wikipedia.org/wiki/Cohen%27s_kappa)

- Usefull in context of unbalanced classes

> Jacob Cohen critiqued use of percent agreement due to its inability to account for chance agreement. He introduced the Cohen's kappa, developed to account for the possibility that raters actually guess on at least some variables due to uncertainty. Like most correlation statistics,

# Confusion matrix 


# Sensitivity, specificity, FPrate, FNrate, DP, FA, ...

On définit trois types d'erreurs : 

* erreur globale de classement : $(FP +FN)/total$

* erreur de type 1 : $FP/N$

* erreur de type 2 : $FN/P$

benefits($TP_{rate}$) and costs ($FP_{rate}$)
... 

# G means

Geometric mean is an intersting measure because it computes the geometric mean of the accuracies of the two classes, attempting to maximise them while obtaining good balance. 

$$Gmean = \sqrt{\frac{TP}{TP + FN} \times \frac{TN}{TN+FP}} \times \sqrt{sensitivity \times specificity}$$

# F measures

$$F_{\beta} = \frac{(1 + \beta)^2 \times recall \times precision}{\beta^2 \times recall + precision}$$
where $\beta$ is a coefficient to adjust relative importance of recall with respect to precision.

# dominance


