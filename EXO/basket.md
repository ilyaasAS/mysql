Voici les instructions de création des tables pour la base de données sur le thème du **basket-ball** que vous pouvez donner à vos étudiants. Ces instructions permettent de créer la structure nécessaire pour réaliser les exercices.

---

# Connexion à une base de données :

mysql -u root

# Afficher les base de données :

show databases;


### **1. Création de la base de données**

Tout d'abord, créez une base de données pour le projet `ligue_basket`.

create database ligue_basket

# Sélectionner une base de données:

use ligue_basket

### **2. Création des tables**

#### **Table `team`**

Cette table contient les informations sur les équipes :

-   id, name, city

<!-- 

CREATE TABLE team (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    city VARCHAR(255) NOT NULL
);

-->

#### **Table `player`**

Cette table stocke les informations sur les joueurs de basket :

-   id, name, team_id, size, weight, point_avg

<!-- 

CREATE TABLE player (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    team_id INT,
    size DECIMAL(4,2) NOT NULL,
    weight DECIMAL(5,2) NOT NULL,
    point_avg DECIMAL(4,1) NOT NULL,
    age INT,
    FOREIGN KEY (team_id) REFERENCES team(id)
);

-->

#### **Table `matchs`**

Cette table stocke les informations sur les matchs joués :

-   id, team_local, team_visitor, points_local, points_visiteur, date_match`

<!-- 

CREATE TABLE matchs (
    id INT AUTO_INCREMENT PRIMARY KEY,
    team_local INT,
    team_visitor INT,
    points_local INT,
    points_visiteur INT,
    date_match DATE NOT NULL,
    FOREIGN KEY (team_local) REFERENCES team(id),
    FOREIGN KEY (team_visitor) REFERENCES team(id)
);

-->




### **Modifier la table `player`**

- ajouter le champ age à la table player


ALTER TABLE player
ADD age INT;



# Afficher les tables :

show tables;

---

---

### **4. Insertion de données d'exemple**

Vous pouvez insérer quelques données d'exemple pour permettre aux étudiants de tester leurs requêtes.

#### **Données pour la table `team` :**

INSERT INTO team (name, city) VALUES
('Panthers', 'Paris'),
('Lions', 'Lyon'),
('Tigers', 'Marseille'),
('Eagles', 'Toulouse'),
('Bears', 'Bordeaux'),
('Wolves', 'Nice'),
('Sharks', 'Nantes'),
('Falcons', 'Lille'),
('Dragons', 'Rennes'),
('Rhinos', 'Strasbourg');


#### **Données pour la table `player` :**

INSERT INTO player (name, team_id, size, weight, point_avg, age) VALUES
('John Doe', 1, 2.05, 100.50, 22.3, 25),
('Jane Smith', 2, 1.98, 85.30, 18.4, 23),
('Mike Johnson', 3, 2.10, 120.00, 25.5, 28),
('Emily Davis', 4, 1.85, 75.00, 17.8, 26),
('Chris Brown', 5, 1.95, 90.20, 20.1, 29),
('Amanda Green', 6, 2.03, 88.50, 22.9, 27),
('Robert Black', 7, 2.02, 105.30, 23.5, 24),
('Paul White', 8, 1.97, 95.40, 19.2, 22),
('David Miller', 9, 2.06, 98.70, 21.0, 30),
('Laura Clark', 10, 1.92, 92.10, 18.5, 31),
('Kevin Lewis', 1, 2.08, 110.00, 24.2, 29),
('Sarah Wilson', 2, 1.88, 78.90, 16.7, 25),
('Brian Lee', 3, 1.93, 84.50, 19.8, 22),
('Natalie Moore', 4, 1.83, 72.40, 18.0, 26),
('James King', 5, 2.07, 103.20, 26.3, 28),
('Megan Scott', 6, 1.89, 83.30, 17.9, 21),
('Tom Harris', 7, 1.91, 88.60, 18.7, 24),
('Jennifer Taylor', 8, 1.86, 80.40, 15.8, 27),
('George Walker', 9, 2.01, 100.20, 23.9, 26),
('Lisa Hall', 10, 1.80, 76.50, 14.2, 22),
('Brandon Young', 1, 2.04, 99.10, 22.7, 24),
('Rachel Turner', 2, 1.90, 81.20, 17.4, 30),
('Jeff Adams', 3, 1.98, 93.40, 21.9, 28),
('Alice Thompson', 4, 1.84, 74.30, 16.5, 23),
('Steve Hill', 5, 2.09, 110.50, 25.0, 29),
('Emily Allen', 6, 1.82, 72.20, 15.6, 21),
('Jack Martinez', 7, 1.95, 89.80, 19.0, 25),
('Emma Lopez', 8, 1.88, 80.10, 17.5, 26),
('Daniel Hernandez', 9, 2.02, 104.00, 22.8, 30),
('Sophia Carter', 10, 1.87, 79.00, 15.3, 24);

#### **Données pour la table `matchs` :**

INSERT INTO matchs (team_local, team_visitor, points_local, points_visiteur, date_match) VALUES
(1, 2, 105, 99, '2023-03-21'),
(3, 4, 120, 115, '2023-04-15'),
(1, 3, 95, 110, '2023-05-10'),
(2, 4, 100, 102, '2023-06-01'),
(5, 6, 90, 89, '2023-06-15'),
(7, 8, 115, 112, '2023-07-10'),
(9, 10, 108, 103, '2023-07-20'),
(1, 5, 112, 106, '2023-08-01'),
(2, 6, 101, 99, '2023-08-05'),
(3, 7, 118, 120, '2023-08-12'),
(4, 8, 109, 105, '2023-08-20'),
(9, 1, 122, 119, '2023-08-25'),
(10, 2, 111, 110, '2023-09-01'),
(5, 3, 102, 107, '2023-09-07'),
(6, 4, 98, 99, '2023-09-14');



---

Voici les 20 exercices **sans les réponses** pour que vous puissiez les donner à vos élèves :

---

### **Exercices SQL : Thème Basket**

#### **1. Sélection basique :**

-   **Objectif** : Afficher tous les joueurs inscrits dans la base de données.

SELECT * FROM player;

---

#### **2. Filtrer les résultats :**

-   **Objectif** : Afficher uniquement les joueurs dont la taille dépasse 2,00 mètres.

SELECT * FROM player WHERE size > 2.00;

---

#### **3. Ajouter une nouvelle colonne :**

-   **Objectif** : Ajouter une colonne `age` dans la table `player` pour stocker l'âge des joueurs.

ALTER TABLE player ADD age INT;

---

#### **4. Mettre à jour des valeurs :**

-   **Objectif** : Mettre à jour l'âge des joueurs pour un joueur spécifique, en utilisant son ID.

UPDATE player SET age = 30 WHERE id = 1;


---

#### **5. Trier les résultats :**

-   **Objectif** : Afficher tous les joueurs, triés par leurs points moyens (du plus élevé au plus bas).

SELECT * FROM player ORDER BY point_avg DESC;

---

#### **6. Sélection avec conditions :**

-   **Objectif** : Sélectionner les joueurs qui pèsent plus de 100 kg et mesurent moins de 2,10 mètres.

SELECT * FROM player WHERE weight > 100 AND size < 2.10;


---

#### **7. Compter les enregistrements :**

-   **Objectif** : Compter combien de joueurs sont dans chaque équipe.

SELECT team_id, COUNT(*) AS player_count FROM player GROUP BY team_id;


---

#### **8. Utiliser les alias :**

-   **Objectif** : Afficher les noms des joueurs et leur moyenne de points, mais en utilisant des alias pour nommer les colonnes de manière plus lisible.

SELECT name AS player_name, point_avg AS average_points FROM player;


---

___#### **9. Ajouter une contrainte :**

-   **Objectif** : Ajouter une contrainte à la table `player` pour que la taille des joueurs soit toujours supérieure à 0.

ALTER TABLE player ADD CHECK (size > 0);


---

#### **10. Requête avec `JOIN` :**

-   **Objectif** : Afficher les noms des joueurs ainsi que le nom de leur équipe en utilisant une jointure entre les tables `player` et `team`.


SELECT player.name AS player_name, team.name AS team_name
FROM player
JOIN team ON player.team_id = team.id;

---

#### **11. Requête avec plusieurs conditions :**

-   **Objectif** : Afficher les joueurs ayant une moyenne de points supérieure à 20 et appartenant à une équipe basée à Paris.

SELECT player.name
FROM player
JOIN team ON player.team_id = team.id
WHERE point_avg > 20 AND team.city = 'Paris';

---

#### **12. Grouper les résultats :**

-   **Objectif** : Afficher le nombre total de points marqués par chaque équipe lorsqu'elles jouent à domicile.

SELECT team_local, SUM(points_local) AS total_points
FROM matchs
GROUP BY team_local;

---

#### **13. Utiliser `HAVING` :**

-   **Objectif** : Afficher les équipes ayant marqué plus de 1000 points à domicile (utiliser `GROUP BY` et `HAVING`).

SELECT team_local, SUM(points_local) AS total_points
FROM matchs
GROUP BY team_local
HAVING SUM(points_local) > 1000;

---

#### **14. Ajouter une colonne calculée :**

-   **Objectif** : Afficher les joueurs avec leur indice de masse corporelle (IMC), calculé à partir de leur poids et de leur taille.

SELECT name, weight / (size * size) AS BMI
FROM player;

---

#### **15. Requête d'agrégation avec jointure :**

-   **Objectif** : Afficher la moyenne des points par joueur pour chaque équipe.

SELECT team.name AS team_name, AVG(player.point_avg) AS average_points_per_player
FROM player
JOIN team ON player.team_id = team.id
GROUP BY team.name;

---

#### **16. Trouver des doublons :**

-   **Objectif** : Trouver les matchs où une équipe a joué contre elle-même (l'équipe locale est la même que l'équipe visiteuse).

SELECT * FROM match
WHERE team_local = team_visitor;

---

#### **17. Suppression d'enregistrements :**

-   **Objectif** : Supprimer les joueurs ayant une moyenne de points inférieure à 5.


DELETE FROM player WHERE point_avg < 5;

---

### **Remarques pédagogiques :**

Chaque exercice est conçu pour introduire progressivement des concepts SQL, depuis des requêtes simples jusqu'à des jointures complexes et des modifications structurelles de la base de données. Les élèves pourront ainsi manipuler les données de manière efficace et explorer les différents outils que SQL met à disposition pour gérer les bases de données.
