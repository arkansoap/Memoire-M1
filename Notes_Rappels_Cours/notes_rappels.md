#  modèles prédictifs de classification dans le cadre d'un échantillon non équilibré
  * présentation de la problématique
  * présentation de solutions
  * application sous R et comparaison des résultats sur différentes bases de données
  * référence de départ : C16-Remedies for Severe Class Imbalance, Applied Predictive Modeling, 
    Max Kuhn and Kjell Johnson 


# Rencontres avec Mme scholler : 

## Premier Visio :
- surechantillonage et souséchantillonage
- trouver des bases de données. 
- rose > caret , over and under sampling
- code propre


## Deuxieme visio : 

- base de données 
spotifiy, recidivist et cate bancaire haut de gamme, detection de fraude, taux de chum , kagle . base des collegues . 
- models
regression logistic, lda, rf and boosting. SVM pourquoi pas ? ... ch 13 et 14 -> se concentrer sur les modèles connus. 
- autres axes solutions
SMOTE (the r journal) et ROSE 

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
sparse (clairesmée; dispersée, rare)

**Wrapper function** : A wrapper function is a subroutine in a software library or a computer program whose main purpose is to call a second subroutine or a system call with little or no additional computation. en.wikipedia.org
**Fonction wrapper** : En programmation informatique, une fonction wrapper (de l'anglais « "wrapper function" ») est un programme dont la fonction principale est d'appeler une autre fonction. 

# Rappels, liens et phrases clés pour moi :

- [Site Julie Scholler](https://juliescholler.gitlab.io/)

- Hygiène mentale : [statistique fréquentiste Vs statitistique bayésienne](https://www.youtube.com/watch?v=x-2uVNze56s&t=1221s) 
    - stat fréquentiste : probabilités des évènements selon une certaine théorie.
    - stat bayésienne : probabilités des théories au vu de certains évènements.

- [video conseillée par PE sur maximu de vraisemblance](https://www.youtube.com/watch?v=VOIhswqFWVc) 

- Lift curves: définition wikipédia

En exploration de données, le lift est une mesure de la performance d'un modèle prédictif ou descriptif, mesuré par rapport au modèle du choix aléatoire.
Par exemple, supposons qu'une population ait un taux de réponse prédit égal à 5 %, mais qu'un certain modèle a identifié un segment avec un taux de réponse prédit de 20 %. Ce segment aura donc un lift de 4.0 (20 % / 5 %). Typiquement, le concepteur cherche à diviser la population en quantiles, et ordonner ces quantiles par lift. Les organisations peuvent ensuite  examiner chaque quantile, et en pesant les taux de réponse prédit par rapport au coût de l'opération par exemple, elles peuvent décider de prospecter tel ou tel quantile.

- Courbe ROC:

Les courbes ROC furent inventées pendant la Seconde Guerre mondiale pour montrer la séparation entre les signaux radar et le bruit de fond.

Elles sont souvent utilisées en statistiques pour montrer les progrès réalisés grâce à un classificateur binaire lorsque le seuil de discrimination varie. Si le modèle calcule un score s qui est comparé au seuil S pour prédire la classe (c.-à-d. (s < S) → positif et (s ≥ S) → négatif), et qu’on compare ensuite avec les classes réelles (Positif et Négatif), la sensibilité est donnée par la fraction des Positifs classés positifs, et l’antispécificité (1 moins la spécificité) par la fraction des Négatifs classés positifs. On met l’antispécificité en abscisse et la sensibilité en ordonnée pour former le diagramme ROC. Chaque valeur de S fournira un point de la courbe ROC, qui ira de (0, 0) à (1, 1).

À (0, 0) le classificateur déclare toujours 'négatif' : il n’y a aucun faux positif, mais également aucun vrai positif. Les proportions de vrais et faux négatifs dépendent de la population sous-jacente.

À (1, 1) le classificateur déclare toujours 'positif' : il n’y a aucun vrai négatif, mais également aucun faux négatif. Les proportions de vrais et faux positifs dépendent de la population sous-jacente.

Un classificateur aléatoire tracera une droite allant de (0, 0) à (1, 1).

À (0, 1) le classificateur n’a aucun faux positif ni aucun faux négatif, et est par conséquent parfaitement exact, ne se trompant jamais.

À (1, 0) le classificateur n’a aucun vrai négatif ni aucun vrai positif, et est par conséquent parfaitement inexact, se trompant toujours. Il suffit d’inverser sa prédiction pour en faire un classificateur parfaitement exact.
