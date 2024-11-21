# ? LDD : Langage de Définition de Données (DDL : Data Definition Language)
# ? Le langage de définition de données (DDL) est utilisé pour définir la structure de la base de données.

# Voici quelques-unes des principales commandes pour créer et modifier une base de données dans MySQL :

# Afficher les tables :

show tables;

# Créer une tables :

# VARCHAR --) Chaine de carractère

create table user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255),  
    age INT DEFAULT 0,
    email VARCHAR(255) UNIQUE,
    code_postal CHAR(5) UNIQUE

);

# Montre moi la creation de la table:

show create table nom_table

# Décrit moi la table nom_de_la_table:

describe nom_table

# Supprimer une table:

drop table nom_table

# Modifier le nom de la table

alter table anciennetable rename to nouvelletable

rename table anciennetable to nouvelletable

# Ajouter une colonne adress:

alter table nom_table add nom_column type

# modifier le TYPE de la colonne (adress) varchar(100):

# Formumle:
ALTER TABLE table_name
MODIFY column_name column_definition

# Exemple:
ALTER TABLE user
MODIFY adress varchar(100);

# modifier le type de la colonne (adress) adresse:

# Formumle:
alter table nom_table modify nom_column type;

# Exemple:
alter table user modify adress varchar(255);

# supprimer la colonne (adress):

# Formumle:
ALTER TABLE nom_table
DROP nom_colonne

# Exemple:
ALTER TABLE user
DROP adress

# créer une table formation
identifiant
intitule # * unique non null
description # * (beaucoup de texte)
duree # * supérieur à 7 jours,

create table formation (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) UNIQUE NOT NULL,
    description LONGTEXT,
    period INT check(period > 7)
);


# Affichage de la structure d'une table :
   SHOW CREATE TABLE nom_table;

# Affichage des colonnes d'une table :
   DESCRIBE nom_table;

# Suppression d'une table :
   DROP TABLE nom_table;

# Renommer une table :
   RENAME TABLE ancien_nom TO nouveau_nom;

# Ajouter une colonne :
   ALTER TABLE nom_table ADD nom_colonne type_de_donnees;

# Modifier le type de données d'une colonne :
   ALTER TABLE nom_table MODIFY colonne nouveau_type_de_donnees;

# Modifier le nom d'une colonne :
   ALTER TABLE nom_table CHANGE COLUMN ancien_nom nouveau_nom type_de_donnees;

# Supprimer une colonne :
   ALTER TABLE nom_table DROP COLUMN nom_colonne;