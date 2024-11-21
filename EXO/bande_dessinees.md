# Exercice : Gestion d'une Base de Données pour des Bandes Dessinées Belges

Dans cet exercice, vous allez concevoir et interroger une base de données pour gérer des bandes dessinées belges. L'objectif est de structurer les informations sur les bandes dessinées, les auteurs et les éditeurs, puis de réaliser des requêtes SQL pour extraire des données spécifiques.

## Étapes à Réaliser

Afficher les base de données :

# show databases;

### 1. Créer la Base de Données

Créez une base de données nommée `bd_collection_db` pour stocker toutes les informations.

# create database bd_collection_db;

Afficher les base de données :

# show databases;

### 2. Sélectionner la Base de Données

Assurez-vous que vous utilisez la base de données nouvellement créée pour toutes les prochaines opérations.


# use bd_collection_db;


### 3. Créer la Table `auteur`

Définissez une table `auteur` pour stocker les informations des auteurs de bandes dessinées, incluant un identifiant unique, le nom de l'auteur et sa nationalité.

<!-- 

create table auteur (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL UNIQUE,
    nationalite VARCHAR(255)
);

 -->

Afficher les tables :

# show tables;

Montre moi la creation de la table:

# show create table auteur;

Décrit moi la table nom_de_la_table:

# describe auteur;

--- 
### 4. Insérer des Données dans la Table `auteur`

Ajoutez au moins trois auteurs dans cette table, en utilisant les valeurs suggérées ou en créant vos propres exemples.

# INSERT INTO auteur (id, name, nationalite) VALUES ('1', 'Jules Verne', 'France');
# INSERT INTO auteur (id, name, nationalite) VALUES ('2', 'Alexandre Dumas', 'France');
# INSERT INTO auteur (id, name, nationalite) VALUES ('3', 'Honoré de Balzac', 'France');


Voir 
# select * from auteur;

### 5. Créer la Table `editeur`

Définissez une table `editeur` pour stocker les informations des éditeurs de bandes dessinées, incluant un identifiant unique, le nom de l'éditeur et son pays.

<!-- 

create table editeur (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name_editing VARCHAR(255) NOT NULL,
    pays VARCHAR(255)
);

 -->

Afficher les tables :

# show tables;

Montre moi la creation de la table:

# show create table editeur;

Décrit moi la table nom_de_la_table:

# describe editeur;

### 6. Insérer des Données dans la Table `editeur`

Ajoutez au moins trois éditeurs dans cette table, en utilisant les valeurs suggérées ou en créant vos propres exemples.

# INSERT INTO editeur (name_editing, pays) VALUES ('Editions Hachette', 'France');
# INSERT INTO editeur (name_editing, pays) VALUES ('Claude Schopp', 'France');
# INSERT INTO editeur (name_editing, pays) VALUES ("Lord R'Hoone", 'France');


Voir 
# select * from editeur;


### 7. Créer la Table `bd`

Définissez une table `bd` pour stocker les informations des bandes dessinées, incluant un identifiant unique, le titre, l'ID de l'auteur, l'ID de l'éditeur, et l'année de parution. 


Afficher les tables :

# show tables;

<!-- 

create table bd (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    id_auteur INT NOT NULL,
    id_editeur INT NOT NULL,
    annee_sortie INT(4) NOT NULL,
    CONSTRAINT fk_author_id FOREIGN KEY (id_auteur) REFERENCES auteur (id),
    CONSTRAINT fk_author_id FOREIGN KEY (id_editeur) REFERENCES editeur (id),
);

 -->

Afficher les tables :

# show tables;

Montre moi la creation de la table:

# show create table bd;

Décrit moi la table nom_de_la_table:

# describe bd;

----- Créez des relations entre la table `bd` et les tables `auteur` et `editeur` à l'aide de clés étrangères.

<!-- CREATE TABLE bd (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    id_auteur INT NOT NULL,        -- Utilisation de INT au lieu de VARCHAR
    id_editeur INT NOT NULL,       -- Utilisation de INT au lieu de VARCHAR
    annee_sortie VARCHAR(4) NOT NULL,
    FOREIGN KEY (id_auteur) REFERENCES auteur(id),
    FOREIGN KEY (id_editeur) REFERENCES editeur(id)
); -->

# INSERT INTO auteur (name, nationalite) VALUES ('Hergé', 'Belgique');
# INSERT INTO editeur (name_editing, pays) VALUES ('Casterman', 'France');

# INSERT INTO bd (title, id_auteur, id_editeur, annee_sortie) VALUES ('Tintin au Tibet', 1, 1, '1960');  
-- 1 correspond aux IDs des auteurs et éditeurs insérés précédemment




---- ### 8. Insérer des Données dans la Table `bd`

Ajoutez au moins trois bandes dessinées dans cette table, en utilisant les valeurs suggérées ou en créant vos propres exemples.

# INSERT INTO auteur (name, nationalite) VALUES ('René Goscinny', 'Française'), ('Albert Uderzo', 'Française');

# INSERT INTO editeur (name_editing, pays) VALUES ('Dargaud', 'France'), ('Hachette', 'France');

Voir
# SELECT * FROM auteur;
# SELECT * FROM editeur;

# INSERT INTO bd (title, id_auteur, id_editeur, annee_sortie) VALUES ('Astérix le Gaulois', 1, 1, '1961'),    ('Astérix et Cléopâtre', 1, 2, '1965');  



Voir 
# select * from bd;


### 9. Requêtes SQL

Effectuez les requêtes suivantes pour extraire des informations spécifiques de votre base de données :

-   **a.** Affichez toutes les bandes dessinées avec les informations complètes (titre, auteur, éditeur et année de parution).
-   **b.** Affichez toutes les bandes dessinées publiées par un éditeur spécifique (par exemple, "Casterman").
-   **c.** Affichez toutes les bandes dessinées publiées après une certaine année (par exemple, après 1960).

---

# a

SELECT 
    bd.title AS Titre,
    auteur.name AS Auteur,
    editeur.name_editing AS Editeur,
    bd.annee_sortie AS Annee_De_Parution
FROM 
    bd
JOIN 
    auteur ON bd.id_auteur = auteur.id
JOIN 
    editeur ON bd.id_editeur = editeur.id;


# b

SELECT 
    bd.title AS Titre,
    auteur.name AS Auteur,
    editeur.name_editing AS Editeur,
    bd.annee_sortie AS Annee_De_Parution
FROM 
    bd
JOIN 
    auteur ON bd.id_auteur = auteur.id
JOIN 
    editeur ON bd.id_editeur = editeur.id
WHERE 
    editeur.name_editing = 'Claude Schopp';


# c

SELECT 
    bd.title AS Titre,
    auteur.name AS Auteur,
    editeur.name_editing AS Editeur,
    bd.annee_sortie AS Annee_De_Parution
FROM 
    bd
JOIN 
    auteur ON bd.id_auteur = auteur.id
JOIN 
    editeur ON bd.id_editeur = editeur.id
WHERE 
    bd.annee_sortie > '1960';


## Objectifs de l'Exercice

-   Structurer une base de données relationnelle pour une collection de bandes dessinées.
-   Manipuler des tables en SQL et définir des relations entre elles.
-   Interroger des données avec des requêtes SQL.

### Consignes pour l'Évaluation

-   La base de données doit être correctement définie avec des relations entre les tables.
-   Les requêtes SQL doivent retourner les résultats attendus.
