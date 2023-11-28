# L'acronyme MERISE ?
Méthode d'Étude et de Réalisation Informatique pour les Systèmes d'Entreprise.

# C'est quoi MERISE ?
Il faut savoir que les termes et/ou concepts MCD et MLD sont associés à la méthodologie de conception de bases de données MERISE. 

# En quoi consiste le concept MERISE ?

MERISE est une méthodologie française de conception de systèmes d'information 
qui a été largement utilisée dans les années 1980 et 1990. 
Elle propose une approche structurée pour la conception de bases de données et d'autres systèmes informatiques. 
Concrétement, dans le contexte de MERISE, il existe deux étapes distinctes dans le processus de conception de bases de données:
## 1. le MCD (Modèle Conceptuel de Données) 
    et 
## 2. le MLD (Modèle Logique de Données) 

En d'autres termes, le MCD est réalisé lors de la phase de conception conceptuelle, 
tandis que le MLD est élaboré lors de la phase de conception logique.

### Quelles sont les différences entre:

        le Modèle Logique de Données (MLD) 
            et
        le Modèle Conceptuel de Données (MCD) 

Ces différences résident dans le niveau d'abstraction et de détail auquel ils se situent lors de la conception d'une base de données.

En effet, d'une manière plus approfondie et explicite,

#### La première étape:

Le Modèle Conceptuel de Données (MCD) présente:

1. Un Niveau d'Abstraction : Le MCD est plus abstrait. 
Il se concentre sur la représentation des concepts métier et des relations entre eux sans se soucier des détails de mise en œuvre.

2. Des Entités et Relations : Dans le MCD, on identifie les entités importantes dans le domaine concerné, 
ainsi que les relations entre ces entités. On spécifie également la nature de ces relations 
(un à un, un à plusieurs, plusieurs à plusieurs).

3. Indépendance du Système de Gestion de Base de Données (SGBD) : Le MCD est indépendant du SGBD choisi. 
Il ne prend pas en compte les spécificités techniques liées au stockage ou à l'implémentation physique des données.

#### L'étape suivante:
==> Le Modèle Logique de Données (MLD) :

1. Un Niveau d'Abstraction : Le MLD est plus concret que le MCD. 
Il représente la structure logique des données, prenant en compte des détails tels que les types de données, 
les clés primaires, les clés étrangères, etc.

2. Une Structuration des Données : Dans le MLD, on traduit les concepts abstraits du MCD en structures de données concrètes.
On spécifie comment les données seront organisées, stockées et reliées dans la base de données.

3. Dépendant du SGBD : Le MLD est spécifique au SGBD choisi. 
Il tient compte des caractéristiques et des exigences spécifiques du système de gestion de base de données 
pour lequel la conception est réalisée.

En résumé, le MCD se situe à un niveau plus élevé d'abstraction, 
décrivant les concepts métier et les relations entre eux, 
tandis que le MLD descend à un niveau plus concret, 
définissant la structure logique des données pour une mise en œuvre spécifique dans un SGBD particulier.

Avant de finir, il faut savoir qu'il existe des spécifications pour chaque projet de base de données 
selon la méthodologie MERISE telles que:

        1. La Normalisation, qui consiste en:

Application des règles de normalisation pour garantir la qualité et l'intégrité des données.
Découpage des tables pour éviter les anomalies et redondances.

        2. Le Modèle Physique des Données (MPD), qui consiste en :

Adaptation du MLD au modèle physique spécifique du SGBD cible.
Définition des types de données, des index, des contraintes, etc.
Schéma physique adapté à la technologie du SGBD choisi.

        3. La Génération de la Base de Données, qui consiste en:

Création effective de la base de données en utilisant le schéma physique généré.
        
        4. L'Implémentation des Traitements, qui consiste en :

Définition des procédures stockées, des déclencheurs, des vues, etc., selon les besoins du système d'information.

        5. La Maintenance et Évolution, qui consiste en:
Suivi de l'utilisation de la base de données et ajustement en fonction des retours d'expérience.
Gestion des évolutions du système d'information et mise à jour de la base de données en conséquence.


Pour conclure, il est important de noter que le cycle de vie d'un projet MERISE ne se limite pas à la seule conception de la base de données. 
Il intègre également d'autres aspects de la conception des systèmes d'information, notamment l'analyse des traitements, 
la conception des interfaces utilisateur, et la gestion des contraintes organisationnelles.



