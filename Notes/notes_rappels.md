#  modèles prédictifs de classification dans le cadre d'un échantillon non équilibré
  * présentation de la problématique
  * présentation de solutions
  * application sous R et comparaison des résultats sur différentes bases de données
  * référence de départ : C16-Remedies for Severe Class Imbalance, Applied Predictive Modeling, 
    Max Kuhn and Kjell Johnson 

# List of book and articles : 

- [From google scholar](https://scholar.google.fr/scholar?hl=en&as_sdt=0%2C5&q=imbalanced+class+classification+problem&btnG=)
  - Byon Eunshin, Shrivastava, AbhishekK, Ding, Yu :A classification procedure for highly imbalanced class sizes.
- referenced by max kuhn in his book  
  - Menardi and Torelli (2013) : ROSE
  - Fisher(1936) and Wells(1939) : LDA
  - Weiss and Provost (2001a) :  priors that reﬂect the natural class imbalance will materially bias
  predictions to the majority class
  - Ting (2002) : One approach to rebalancing the training set would be to increase the
  weights for the samples in the minority classes. 
  - Artis et al. (2002) : sampling methods
  - Ling and Li (1998) : provide one approach to up-sampling in which cases
  from the minority classes are sampled with replacement until each class has approximately the same number.
  - Chawla et al. (2002) : SMOTE
  - A substantial amount of research has been conducted on the eﬀectiveness of using sampling procedures to combat skewed class distributions, most notably Weiss and Provost (2001b), Batista et al. (2004), Van Hulse et al. (2007), Burez and Van den Poel (2009), and Jeatrakul et al. (2010).
  -  For class imbalances, unequal costs for each class can adjust the parameters to increase or decrease the sensitivity of the model to particular classes (Veropoulos et al. 1999)
  - Johnson and Wichern (2001),  Breiman et al. (1984): COSTS

# Rencontres avec Mme scholler : 

## Premier Visio :
- surechantillonage et souséchantillonage
- trouver des bases de données. 
- rose > caret , over and under sampling
- code propre

## Deuxieme visio : 

- base de données 
spotifiy, recidivist, carte bancaire haut de gamme, detection de fraude, taux de chum , kagle. base des collegues . 
- models
regression logistic, lda, rf and boosting. SVM pourquoi pas ? ... ch 13 et 14 -> se concentrer sur les modèles connus. 
- autres axes solutions
SMOTE (the r journal) et ROSE 

## Question pour visio 3 :

- Faire une fonction pour les mesures de performance utilisable pour tous les modèles !!!
  - roc, auc, liftcurve, kappa, accuracy

- Faire une Fonction pour tuner les paramètres ? / pour lancer les modèles ?

- quoi en "0" et en "1" choice of positive class and negative class?

- prior knowledge about data ? ( for kernel choice and other things )

- separer coeurs pr bosser pdt que r tourne / 2 sessions de r possibles ? /cb de temps je laisse tourner avant d arreter ?

- choix base données préselectionnées :
  - covtype : classer type d'arbres minoritaires ? classer un type de sols ? (on peut dire prédire?)
  - chess : classer parties nulles / classer type d'ouverture en fonctions de certains paramètres?
- spotify : 
  - un seul découpage ou plusieurs, suite des découpages H et B ou test de inaudible ? fonction distinct? 
  - proc ???
  - grid , expand.grid... , gamma and coeff(0) for svm.
- problème ordinateur : fac ouverte jusqu' à quand ? possibilité travailler pc fac (assez puissant?)?
- github : 
  - base de données trop grosses. github lfs, autres ou no need de mettre à dispo les bases (liens suffisants)
  - img n'apparaissent pas ds readme alors que ça fonctionne sous VScode
- compréhension des modèles et techniques de correction en cours, question viendront avec le travail en dur sur les bases de données. 
- pourquoi tydiverse ne charge pas lubridate?
- caravan : pourquoi ça ne fonctionne pas ? explication de ces fonctions.
- Pour un code opti et propre : tidymodels ok ou encore trop complexe ? 
  > rsample (sampling), recipe(pre-processing), parsnip(specify the model), workflows(putting everything together), tune(tuning hyperparameters), yardsticks(evaluate the model), ...

# Vocabulaire:
amounts (quantités) \
overwhelmed (subergé) \
overcoming (suronter, résoudre) \
derived (dérivé, issu, tiré, déduit) \
prior (distribution) (préalable, initial) ?? \
cuttoff (seuil) ?? \
case weights (pondération) \
straightforward (simple, direct, explicite) \
roughly (grossièrement, brutalement) \
plagues (tourmenter, harceler) \ 
towards (envers) \
sparse (clairesmée; dispersée, rare) \
reach (portée, étendue) \
reaching (atteindre) \
range (gamme) \
skewd class distribution ( distribution asymétrique des classes) \
subset (sous-ensemble) \
retain (conserve)

**Wrapper function** : A wrapper function is a subroutine in a software library or a computer program whose main purpose is to call a second subroutine or a system call with little or no additional computation. en.wikipedia.org
**Fonction wrapper** : En programmation informatique, une fonction wrapper (de l'anglais « "wrapper function" ») est un programme dont la fonction principale est d'appeler une autre fonction. 

# Rappels, liens et phrases clés pour moi :

- [Site Julie Scholler](https://juliescholler.gitlab.io/)

- Hygiène mentale : [statistique fréquentiste Vs statitistique bayésienne](https://www.youtube.com/watch?v=x-2uVNze56s&t=1221s) 
    - stat fréquentiste : probabilités des évènements selon une certaine théorie.
    - stat bayésienne : probabilités des théories au vu de certains évènements.

- [video conseillée par PE sur maximu de vraisemblance](https://www.youtube.com/watch?v=VOIhswqFWVc) 
