#  modèles prédictifs de classification dans le cadre d'un échantillon non équilibré
  * présentation de la problématique
  * présentation de solutions
  * application sous R et comparaison des résultats sur différentes bases de données
  * référence de départ : C16-Remedies for Severe Class Imbalance, Applied Predictive Modeling, 
    Max Kuhn and Kjell Johnson


## Premier Visio :
- surechantillonage et souséchantillonage
- trouver des bases de données. 
- rose > caret , over and under sampling
- code propre

## Vocabulaire:
amounts (quantités) \
overwhelmed (subergé) \
overcoming (suronter, résoudre) \
derived (dérivé, issu, tiré, déduit) \
prior (distribution) (préalable, initial) ?? \
cuttoff (seuil) ?? \
case weights (pondération) \
straightforward (simple, direct, explicite) \
roughly (grossièrement, brutalement) \
plagues (tourmenter, harceler)


## Notes de lecture ch.16:

- measure :Accuracy, Kappa??, Sensitivity, specificity, ROC Auc

- good specificity but bad sensitivity -> same in Spotify study?

### Résumé des sous parties et questionnement :

#### 16.3: Model tuning 
> The simplest approach to counteracting the negative eﬀects of class imbalance is to tune the model to maximize the accuracy of the minority class(es).

Tuning the model : what paremetrs of which type ? only for RF i think
Didn't work for spotify or did i make it bad?

> Given that the increase in sensitivity is not high enough to be considered acceptable

Exactly the same for my works on spotify, not enouhgh high 

#### 16.4: Alternate Cutoffs

Did i really understand what it is?

> When there are two possible outcome categories, another method for increasing the prediction accuracy of the minority class samples is to determine alternative cutoﬀs for the predicted probabilities

Not a real solution for our issue because it changes our definition classes 

> which eﬀectively changes the deﬁnition of a predicted event. 

Unless we do it with care / i don't think it is a good solution

> There may be situations where the sensitivity/speciﬁcity trade-oﬀ can be accomplished without severely compromising the accuracy of the majority class (which, of course, depends on the context of the problem).

Interesting if : 

- focus on a compromise beetween sensityvioty and specificity.
> particular target that must be met for the sensitivity or speciﬁcity,
- we want to maximise accuracy.
> Find the point on the ROC curve that is closest (i.e., the shortest distance) to the perfect model (with 100 % sensitivity and 100 % speciﬁcity)
- use of Youden's J index ???
> (see Sect. 11.2), which measures the proportion of correctly predicted samples
for both the event and nonevent groups. This index can be computed for each
cutoﬀ that is used to create the ROC curve.

Use a cutoff of 0,064 ?? (am i talking of cuttoff in my spotify works?)

#### 16.5: Adjusting Prior probabilities 

Did i confuse beetween prior probabilities and alternate cutoffs? I'm a bit lost... i remember Mr Piller called it prior sample what it seems to be alternate cuttoff (i have to check it!!)

What does it means? It's not 50% as default 

> Unless speciﬁed manually, these models typically derive the value of the priors from the training data.

prior ou prior probabilities?

> Using more balanced priors or a balanced training set may help deal with a class imbalance.

here i understand the prior is the repartition (allocation) of the sample.

> For the insurance data, the priors are 6 % and 94 % for the insured and uninsured, respectively.

I'm confused... priors probabilities or distribution.

> For example, new priors of 60 % for the insured and 40 % for the uninsured in the FDA model increase the probability of having insurance signiﬁcantly.

#### 16.6: Unequal Case Weights : 

For many predictive models of classification, this technic is possible. 

> One approach to rebalancing the training set would be to increase the weights for the samples in the minority classes (Ting 2002). 

To illustrate : 

>  can be interpreted as having identical duplicate data points with the exact same predictor values

#### 16.7: Sampling Methods

Very similar than case weights

- With a priori knowledge of a class imbalance : 

>  to select a training set sample to have roughly equal event rates during the initial data collection.

>  we can attempt to balance the class frequencies.

- Post hoc approaches : down sampling and over sampling the data

> Up-sampling is any technique that simulates or imputes additional data points to improve balance across classes

> Down-sampling refers to any technique that reduces the number of samples to improve the balance across classes

Example of upsampling : Ling and Lee (1998) -> adding random sample to the minority class

> Ling and Li (1998) provide one approach to up-sampling in which cases from the minority classes are sampled with replacement until each class has approximately the same number. 

... Finir de Lire cette sous partie ...

#### 16.8: Cost sensitive Trainig:

