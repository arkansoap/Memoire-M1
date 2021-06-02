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

!!!obligation de faire des choix dans les techniques pre/ during / post car enormément de techniques proposées.

1. Définition problèmatique : 
  - 1.1 Définition de concepts pour la compréhension : machine learning, classification, mesures de performances des modèles
  - 1.2 Observation des résultats de classification sur échantillons déséquilibrés (3 ou 4 base de données). 
    On fait tourner les modèles et on observe que la machine apprend mal avec des modèles basés sur une classe déséquilibrée. 

    !!!!!la grande question est "qu'est ce que ça nous coute?!!!! qu est ce qu'on est pret à concéder en terme d'erreur globale (et autres aspect) pour coller au mieux aux préférences de l'utilisateur en termes de performance. Arbitrage !!!!!!

2. Présentations et définitions des Solutions : !!!!!!plan à reformuler autour de pre, during post!!!!!

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

- pas de sortie kable ds certaines fonctions pour récupérer données des table ou df
- cost for svm : The cost of constraints violation (default: 1)—it is the ‘C’-constant of the regularization term in the Lagrange formulation.
- pertinence de centrer réduire pour rf , ... ??
- smote only for numeric ?
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
- fammille apply pour appliquer une fonction à un vecteur (au lieu d'utiliser une boucle for)
  - lapply returnes a list
  - sapply (for simplify apply) if all element have the same type . (equivalent à unlist(lapply))
  - vapply : on précise le format de la sortie
- anonymous function :
  Use anonymous function inside lapply()
  lapply(list(1,2,3), function(x) { 3 * x })
- before lost yourself on the web, think to chek the help in R
- regular expression : sequence of charahcters or metacharacters that form a search pattern that u can use to      match strings (pattern existence, replacement, extraction). function using it :  grepl, grep, sub ..
  type mark regex in R console for detail
