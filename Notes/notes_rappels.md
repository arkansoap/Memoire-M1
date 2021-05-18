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

# Idée de plan pour le rendu final : 

1. Définition problèmatique : 
  - 1.1 Définition de concepts pour la compréhension : machine learning, classification, mesures de performances des modèles
  - 1.2 Observation des résultats de classification sur échantillons déséquilibrés (3 ou 4 base de données). 
    On fait tourner les modèles et on observe que la machine apprend mal avec des modèles basés sur une classe déséquilibrée. 

2. Présentations et définitions des Solutions : 

  - 2.1 Optimiser les paramètres : 
  
  - 2.2 Alternate cutt off : 
  
  - 2.4 Fonction de coût :

  - 2.3 Unequal case weights :

  - 2.5 Resamplings methods : 
    - 2.5.1 Over and donw sampling
    - 2.5.2 SMOTE
    - 2.5.3 ROSE
    - 2.5.4 Comparatif des techniques de resampling
    
3. Applications sur bases de données 
  
4. Conclusions
    - 4.1 Avantages et inconvénients de chaque méthode
    - 4.2 Conculsions géngérales ...
  
5. Annexes:
    - 5.1 scripts .rmd complets (préparation bases de données, travaux exhaustifs)
  
# Notes, questions et à faire : 

- SET.SEED CHANGE NUMBER ? I DONT THINK SO  ? AND WHERE ? ONLY BEFORE A SIMULATION OR A SPLIT 
- automatisation avec fonctions (avoir à donner juste un data (préparé en amont), preditors et Topredict.
- spotify : laisser year (center et scale)?
- courbe roc différente avec proc / voir help proc (levels , control and cases) / balanced accuracy?
- changer seuil ds le fit directement ?  est ce possible ? argument PRIOR
- possibilité changer poids pour mod : logit, svm, 
- probit à la place de logit ? QDA au lieu de LDA?
- approfondir les "tune"
- évaluer new data resampled, ROSE et SMOTE, avant et après les fit ?
- préciser ordinal and non ordinal factor
- préciser levels des factors (bas et reste pour 1 et 0)
- AVOIR UN SCRIPT SPOTIFY COMPLET AVEC LE FILE FUNCTIONS_UC.R OPERATIONNEL FIN JUIN AU PLUS TARD !!!
- LIRE ARTICLES 
- BOOSTING et NAIVES BAYES 
- AVERAGE : est ce sensé ?
- Fonctions pour sortir tableau comparatif et graphiques comparatifs à partir des fonctions perf et roc
- Pr faire tourner fonctions avec modèles tuner, possibilité de rajouter un arg tune control

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
- penser au bon "type" pour predict
- `source("file.R")` pour utiliser fonctions sauvegardées dans un fichier .R
- **Wrapper function** : A wrapper function is a subroutine in a software library or a computer program whose main purpose is to call a second subroutine or a system call with little or no additional computation. en.wikipedia.org

  **Fonction wrapper** : En programmation informatique, une fonction wrapper (de l'anglais « "wrapper function" ») est un programme dont la fonction principale est d'appeler une autre fonction. 
- The type="response" option tells R to output probabilities of the form P(Y = 1|X)
- tail() return the first or last object of a part
- args(function) to know what are arguments of a function and their default value
- lapply pour appliquer une fonction à un vecteur (au lieu d'utiliser une boucle for)