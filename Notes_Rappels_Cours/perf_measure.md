# Measure of performance of applied models :

## accuracy

## Lift curves: définition wikipédia

En exploration de données, le lift est une mesure de la performance d'un modèle prédictif ou descriptif, mesuré par rapport au modèle du choix aléatoire.
Par exemple, supposons qu'une population ait un taux de réponse prédit égal à 5 %, mais qu'un certain modèle a identifié un segment avec un taux de réponse prédit de 20 %. Ce segment aura donc un lift de 4.0 (20 % / 5 %). Typiquement, le concepteur cherche à diviser la population en quantiles, et ordonner ces quantiles par lift. Les organisations peuvent ensuite  examiner chaque quantile, et en pesant les taux de réponse prédit par rapport au coût de l'opération par exemple, elles peuvent décider de prospecter tel ou tel quantile.

## Courbe ROC:

Les courbes ROC furent inventées pendant la Seconde Guerre mondiale pour montrer la séparation entre les signaux radar et le bruit de fond.

Elles sont souvent utilisées en statistiques pour montrer les progrès réalisés grâce à un classificateur binaire lorsque le seuil de discrimination varie. Si le modèle calcule un score s qui est comparé au seuil S pour prédire la classe (c.-à-d. (s < S) → positif et (s ≥ S) → négatif), et qu’on compare ensuite avec les classes réelles (Positif et Négatif), la sensibilité est donnée par la fraction des Positifs classés positifs, et l’antispécificité (1 moins la spécificité) par la fraction des Négatifs classés positifs. On met l’antispécificité en abscisse et la sensibilité en ordonnée pour former le diagramme ROC. Chaque valeur de S fournira un point de la courbe ROC, qui ira de (0, 0) à (1, 1).

À (0, 0) le classificateur déclare toujours 'négatif' : il n’y a aucun faux positif, mais également aucun vrai positif. Les proportions de vrais et faux négatifs dépendent de la population sous-jacente.

À (1, 1) le classificateur déclare toujours 'positif' : il n’y a aucun vrai négatif, mais également aucun faux négatif. Les proportions de vrais et faux positifs dépendent de la population sous-jacente.

Un classificateur aléatoire tracera une droite allant de (0, 0) à (1, 1).

À (0, 1) le classificateur n’a aucun faux positif ni aucun faux négatif, et est par conséquent parfaitement exact, ne se trompant jamais.

À (1, 0) le classificateur n’a aucun vrai négatif ni aucun vrai positif, et est par conséquent parfaitement inexact, se trompant toujours. Il suffit d’inverser sa prédiction pour en faire un classificateur parfaitement exact.

## Kappa : Cohen 1960

 The Kappa statistic (also known as Cohen’s Kappa) was originally designed to assess the agreement between two raters (Cohen 1960). Kappa takes into account the accuracy that would be generated simply by chance. The form of the statistic is :

Kappa = (O − E) / (1 − E)

where O is the observed accuracy and E is the expected accuracy based on the marginal totals of the confusion matrix. The statistic can take on values between − 1 and 1; a value of 0 means there is no agreement between the observed and predicted classes, while a value of 1 indicates perfect concordance of the model prediction and the observed classes. Negative values indicate that the prediction is in the opposite direction of the truth, but large negative values seldom occur, if ever, when working with predictive models.

Usefull in context of unbalanced classes