Exercice SQL : Base de Données pour des Figurines Avengers
Dans cet exercice, vous allez créer une base de données pour gérer des figurines des Avengers, incluant deux tables : figurine et weapon. Ensuite, vous effectuerez des requêtes sans utiliser de jointures.

# Connexion à une base de données :

mysql -u root;

# Afficher les base de données :

show databases;

Créez une base de données appelée avengers_db

# create database avengers_db;

Sélectionnez la base de données avengers_db

# use avengers_db;

# Afficher les base de données :

show databases;

Créez une table appelée figurine

La table doit contenir les colonnes suivantes :

id (clé primaire)
nom (nom de la figurine)
super_pouvoir (super-pouvoir de la figurine)
annee_sortie (année de sortie de la figurine)
description (description de la figurine)

<!--  
CREATE TABLE figurine (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL UNIQUE,
    super_pouvoir VARCHAR(255),  
    annee_sortie INT DEFAULT 0,
    description TEXT
);

-->

Montre moi la creation de la table:

# show create table figurine;


Décrit moi la table nom_de_la_table:

# describe figurine;

Insérez des données dans la table figurine
Insérez au moins six figurines avec des informations pertinentes telles que le nom, les super-pouvoirs, l'année de sortie et une description.

<!-- 

INSERT INTO figurine (nom, super_pouvoir, annee_sortie, description)
VALUES 
('Superman', 'Vol, force surhumaine, invulnérabilité', 1938, 'Superman est l\'un des super-héros les plus connus, originaire de la planète Krypton.'),
('Batman', 'Intelligence supérieure, expert en arts martiaux', 1939, 'Batman est un justicier masqué utilisant la technologie et ses compétences pour combattre le crime à Gotham City.'),
('Spider-Man', 'Agilité surhumaine, adhésion aux surfaces, sens d\'araignée', 1962, 'Mordu par une araignée radioactive, Peter Parker devient Spider-Man, un héros doté de super-pouvoirs d\'araignée.'),
('Wonder Woman', 'Force divine, agilité, maîtrise des armes', 1941, 'Wonder Woman est une guerrière amazone qui lutte pour la paix et la justice avec des pouvoirs donnés par les dieux.'),
('Iron Man', 'Armure technologiquement avancée, intelligence supérieure', 1963, 'Tony Stark, un génie milliardaire, crée une armure qui lui confère une force, des capacités de vol et un armement avancé.'),
('Hulk', 'Force illimitée, régénération rapide', 1962, 'Bruce Banner se transforme en Hulk, une créature de force brute et de colère incontrôlable après une exposition à des radiations gamma.');

 -->

voir la donné

# select * from figurine;

Faites des requêtes sur la table figurine:

a. Afficher toutes les figurines

# select * from figurine;


b. Afficher les figurines sorties après l'année 2010

# SELECT * FROM figurine WHERE annee_sortie > 2010;

c. Afficher les figurines ayant "Force" dans leur super-pouvoir

# SELECT * FROM figurine WHERE super_pouvoir LIKE '%Force%';

c bis. Afficher les figurines qui commence par "Force" dans leur super-pouvoir

# SELECT * FROM figurine WHERE super_pouvoir LIKE 'Force%';

c bis 2. Afficher les figurines qui uniquement par "Force" dans leur super-pouvoir

# SELECT * FROM figurine WHERE super_pouvoir LIKE 'Force';

Modifiez une figurine dans la table figurine
Modifiez la description de l'une des figurines.

# UPDATE figurine SET description = 'Nouvelle description pour cette figurine.' WHERE id = 1;

# UPDATE figurine SET description = 'Nouvelle description pour cette figurine.' , year WHERE id = 1;


Supprimez une figurine
Supprimez la figurine "Black Widow" de la table

# DELETE FROM figurine WHERE nom = 'Black Widow';

Voir

# SELECT * FROM figurine WHERE nom = 'Black Widow';


Créez une table appelée weapon
La table doit contenir les colonnes suivantes :
id (clé primaire)
nom (nom de l'arme)
description (description de l'arme)

<!-- 

CREATE TABLE weapon (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    description TEXT
);



 -->

Voir la table

# DESCRIBE weapon;


Insérez des données dans la table weapon
Ajoutez au moins cinq armes associées à différents Avengers.

<!-- 

INSERT INTO weapon (nom, description) VALUES
('Mjölnir', 'Marteau magique de Thor, capable de contrôler la foudre et de voler.'),
'Bouclier de Captain America', 'Bouclier indestructible utilisé par Captain America, fabriqué en vibranium.'),
'Arc et flèches de Hawkeye', 'Armes à distance précises et variées utilisées par Hawkeye, le maître archer.'),
'Gant de l\'Infini', 'Gant avec des pierres infinies, conférant des pouvoirs illimités à son utilisateur.'),
'Armure d\'Iron Man', 'Armure technologiquement avancée créée par Tony Stark, offrant force, vol et armement sophistiqué.');


-->

Voir la table

# DESCRIBE weapon;

Ajoutez une colonne weapon_id dans la table figurine
Ajoutez cette colonne pour lier une figurine à une arme.


# ALTER TABLE figurine ADD COLUMN weapon_id INT;

Voir la table

# DESCRIBE figurine;

Ajoutez une contrainte de clé étrangère à la table figurine
Associez la colonne weapon_id à la clé primaire de la table weapon.

# ALTER TABLE figurine ADD CONSTRAINT fk_weapon FOREIGN KEY (weapon_id) REFERENCES weapon(id);

Voir la table

# SHOW CREATE TABLE figurine;

Mettez à jour la table figurine pour ajouter des armes aux figurines
Attribuez des armes spécifiques à des figurines en mettant à jour la colonne weapon_id.


Voir la table

# SELECT * FROM weapon;


<!-- Associer Mjölnir (weapon_id = 1) à Thor (figurine_id = 1) -->

# UPDATE figurine SET weapon_id = 1 WHERE id = 1;


voir figurine
# SELECT * FROM figurine WHERE nom IN ('Thor', 'Iron Man', 'Captain America');



Afficher les figurines sans arme
Affichez les figurines qui n'ont pas encore d'arme associée.

# SELECT * FROM figurine WHERE weapon_id IS NULL;


Mettez à jour les données d'une figurine
Modifiez l'année de sortie de la figurine "Hulk" pour qu'elle soit mise à jour en 2012.

# UPDATE figurine SET annee_sortie = 2012 WHERE nom = 'Hulk';


voir

# SELECT * FROM figurine WHERE nom = 'Hulk';


Supprimez une arme de la table weapon
Supprimez l'arme "Arc et flèches" de la table weapon.

# SELECT id FROM weapon WHERE nom = 'Arc et flèches';
# DELETE FROM weapon WHERE id = 3;

voir

# SELECT * FROM weapon WHERE nom = 'Arc et flèches';



Ajoutez une colonne à la table weapon
Ajoutez une colonne material pour spécifier le matériau principal de l'arme (ex. : "Vibranium", "Acier", etc.).

# ALTER TABLE weapon ADD COLUMN material VARCHAR(255);

voir

# DESCRIBE weapon;


Modifiez la description d'une arme
Modifiez la description de l'arme "Bouclier" pour y ajouter plus de détails : "Bouclier indestructible fabriqué à partir de vibranium".

# UPDATE weapon SET description = 'Bouclier indestructible fabriqué à partir de vibranium' WHERE nom = 'Bouclier';

voir

# SELECT * FROM weapon WHERE nom = 'Bouclier';

Affichez les figurines sorties entre 2008 et 2012
Effectuez une requête pour afficher toutes les figurines dont l'année de sortie est comprise entre 2008 et 2012 inclus.

# SELECT * FROM figurine WHERE annee_sortie BETWEEN 2008 AND 2012;


Ajouter une nouvelle arme pour "Hawkeye"
Ajoutez une nouvelle arme appelée "Arc de précision" pour Hawkeye, puis associez-la à la figurine correspondante dans la table figurine.

# INSERT INTO weapon (nom, description, material) VALUES ('Arc de précision', 'Arc utilisé par Hawkeye pour des tirs de précision', 'Bois');

# SELECT id FROM weapon WHERE nom = 'Arc de précision';

<!-- -- Associe l'arme "Arc de précision" à Hawkeye -->

# UPDATE figurine SET weapon_id = 5 WHERE nom = 'Hawkeye';


Supprimez toutes les figurines sans super-pouvoir

# DELETE FROM figurine WHERE super_pouvoir IS NULL;
# DELETE FROM figurine WHERE super_pouvoir IS NULL OR super_pouvoir = '';


voir

# SELECT * FROM figurine WHERE super_pouvoir IS NULL OR super_pouvoir = '';


Supprimez les figurines qui n'ont aucune information dans la colonne super_pouvoir.

# DELETE FROM figurine WHERE super_pouvoir IS NULL OR super_pouvoir = '';

voir

# SELECT * FROM figurine WHERE super_pouvoir IS NULL OR super_pouvoir = '';


# Leçon

SELECT, FROM, WHERE, LIKE ODER, LIMIT

<!-- ID, NAME, NAME DESCRIPTION -->

# SELECT id, nom, description FROM figurine;

# SELECT id, nom, description FROM figurine JOIN weapon ON description;

# SELECT * FROM figurine JOIN weapon ON weapon_id=weapon.id;



SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;