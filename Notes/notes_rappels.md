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



# Notes, questions et à faire : 

- fonctions : 
  - pour chaque base : 
    - Y, predictors : pour injecter ds fonctions (automotisation maxium)
    - prediction, realite (pour mesures de perf)
  - utiliser fonction ds une autre fonction ?
  - faire un package de mes fonctions pour les utiliser sur chaque bases de données sans copier la partie fonction (juste un import de library)
  - refaire fonction pour avec pour seul argument pred et real (gerer les dollars ds la fonction)

 grid et expand grid?
- spotify : laisser year (center et scale)?
- courbe roc différente avec proc / voir help proc (levels , control and cases) / balanced accuracy?
- changer seuil ds le fit directement ?  est ce possible ?
- possibilité changer poids pour mod : logit, svm, 
- probit à la place de logit ? QDA au lieu de LDA?
- approfondir les "tune"
- évaluer new data resampled, ROSE et SMOTE, avant et après les fit ?


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
retain (conserve) \
kernel (noyau) \
appointment (designation, rdv)

**Wrapper function** : A wrapper function is a subroutine in a software library or a computer program whose main purpose is to call a second subroutine or a system call with little or no additional computation. en.wikipedia.org
**Fonction wrapper** : En programmation informatique, une fonction wrapper (de l'anglais « "wrapper function" ») est un programme dont la fonction principale est d'appeler une autre fonction. 

# Rappels, liens et phrases clés pour moi :

- [Site Julie Scholler](https://juliescholler.gitlab.io/)

- Hygiène mentale : [statistique fréquentiste Vs statitistique bayésienne](https://www.youtube.com/watch?v=x-2uVNze56s&t=1221s) 
    - stat fréquentiste : probabilités des évènements selon une certaine théorie.
    - stat bayésienne : probabilités des théories au vu de certains évènements.

- [video conseillée par PE sur maximu de vraisemblance](https://www.youtube.com/watch?v=VOIhswqFWVc) 

# Aide mémoire r :

- effacer objet d'un  workspace de r : `rm(objet)` 
- Changer nom d'un objet du WS : `mv("oldname", "newname")` (package gdata)
- courbe roc : 
  - plot(performance(predtest, "acc")) : accuracy et cutoff
  - plot(performance(predtest, "tpr", "fpr")) : true positive and false positive rate
- crée new colonne à un dataframe en utilisant data\$new