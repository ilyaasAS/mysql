# ? LMD : Langages de %anipulation de Données (DML : Data Manipulation Language)

# ? Le language de manipulation  de donnée (DML) est utilisé


# Insertion de données dans une table :

INSERT INTO nom_table (colonne1, colonne2, ...) VALUES (valeur1, valeur2, ...);

INSERT INTO user (first_name, last_name, age, email) 
VALUES ('rachild', 'edjekouane',41,'edjekouane@hotmail.fr'), ('malik', 'edjekouane', 38, 'malik@hotmail.fr');

# Sélection de données :

select * from formation;

select id, first_name from user;


# Inserer les collones dans la table formation

ALTER TABLE formation ADD titre VARCHAR(255);
ALTER TABLE formation ADD prof VARCHAR(255);
ALTER TABLE formation ADD cours VARCHAR(255);

# Inserer des données dans la table formation :

INSERT INTO formation (titre, prof, cours) 
VALUES ('Niveau 5', 'Yasine', 'php');

INSERT INTO formation (titre, prof, cours) 
VALUES ('Niveau 5', 'Yasine', 'php');

# Voir les données

SELECT id, titre, prof, cours FROM formation;

# ? ajouter une colonne dans user (formation_id) entier

ALTER TABLE formation ADD COLUMN formation_id INT PRIMARY KEY;


# ? ajouter une clé étrangère pour lier les 2 tables

alter table user add constraint foreign key (formation_id) references formation (id);

# Sélection de données :

SELECT colonne1, colonne2
FROM nom_table;
WHERE condition
AND condition


# Je veux recuperer tous les livre paru en 1983
# Je veux recuperer tous les livre paru apres 1983
# Je veux recuperer tous les livre paru entre 1960 et 1980
# Je veux recuperer tous les livres triés par date de parution
# Je veux recuperer tous les livres qui contiennent la lettre a dans leur titre





# Je veux recuperer tous les livre paruent en 1960, 1970, 1987
SELECT * FROM book WHERE year IN (1960, 1970, 1987);

# Je veux recuperer tous les livres qui contiennent PAS la lettre a dans leur titre
SELECT * FROM book WHERE title NOT LIKE '%a%';

# Je veux recuperer tous les livres qui commencent par la lettre a dans leur titre

# Je veux recuperer tous les livres triés par ordre decroissant de date de parution
SELECT *
FROM book
WHERE title
LIKE 't%'
AND year> 1930
AND id>=3
ORDER BY year DESC
;

# Je veux recuperer tous les 3 premiers livres
SELECT *
FROM book
LIMIT 3;

# Je veux recuperer tous les livre qui ne sont PAS paruent en 1983
SELECT *
FROM book
WHERE year != 1983;

# Je veux recuperer tous les livre qui ne sont PAS paruent en 1960, 1970, 1987

SELECT *
FROM book
WHERE year NOT IN (1960, 1987, 1878);



