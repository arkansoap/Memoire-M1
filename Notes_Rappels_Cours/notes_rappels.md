#  modèles prédictifs de classification dans le cadre d'un échantillon non équilibré
  * présentation de la problématique
  * présentation de solutions
  * application sous R et comparaison des résultats sur différentes bases de données
  * référence de départ : C16-Remedies for Severe Class Imbalance, Applied Predictive Modeling, 
    Max Kuhn and Kjell Johnson 

# List of book and articles : 

- ROSE : Menardi and Torelli (2013)
- LDA : Fisher(1936) and Wells(1939)
- ...

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

- Faire une Fonction pour tuner les paramètres ?

- quoi en "0" et en "1" choice of positive class and negative class?

- prior knowledge about data ? ( for kernel choice and other things )

- summaryfunction??? twoclasssummary???

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
range (gamme)

**Wrapper function** : A wrapper function is a subroutine in a software library or a computer program whose main purpose is to call a second subroutine or a system call with little or no additional computation. en.wikipedia.org
**Fonction wrapper** : En programmation informatique, une fonction wrapper (de l'anglais « "wrapper function" ») est un programme dont la fonction principale est d'appeler une autre fonction. 

# Rappels, liens et phrases clés pour moi :

- [Site Julie Scholler](https://juliescholler.gitlab.io/)

- Hygiène mentale : [statistique fréquentiste Vs statitistique bayésienne](https://www.youtube.com/watch?v=x-2uVNze56s&t=1221s) 
    - stat fréquentiste : probabilités des évènements selon une certaine théorie.
    - stat bayésienne : probabilités des théories au vu de certains évènements.

- [video conseillée par PE sur maximu de vraisemblance](https://www.youtube.com/watch?v=VOIhswqFWVc) 
