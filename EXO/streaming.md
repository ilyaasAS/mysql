# Gestion d'une Plateforme de Streaming d'Animes

Dans cet exercice, nous allons créer une base de données pour une plateforme de streaming d'animes. Nous allons créer plusieurs tables pour gérer les informations des animes, des épisodes, des utilisateurs, des listes de lecture et des commentaires. Suivez les étapes ci-dessous pour créer les tables et insérer les données nécessaires.

## Étapes à Suivre

# Connexion à une base de données :

    mysql -u root


# Afficher les base de données :

show databases;

### 1. Création de la Base de Données

-   Créez une base de données nommée `anime_streaming_db`.

create database anime_streaming_db


### 2. Utilisation de la Base de Données

-   Utilisez la base de données `anime_streaming_db`.

use anime_streaming_db

### 3. Création de la Table "Animes"

-   Créez une table "Animes" avec les colonnes suivantes :
    -   id_anime (Clé primaire)
    -   titre
    -   studio_production
    -   année_sortie
    -   genre
    -   description
    -   note

<!-- 

CREATE TABLE Animes (
    id_anime INT PRIMARY KEY AUTO_INCREMENT,
    titre VARCHAR(255) NOT NULL,
    studio_production VARCHAR(255),
    annee_sortie YEAR,
    genre VARCHAR(100),
    description TEXT,
    note DECIMAL(3, 2) CHECK (note >= 0 AND note <= 10)
); 

-->


### 4. Création de la Table "Épisodes"

-   Créez une table "Épisodes" avec les colonnes suivantes :
    -   id_episode (Clé primaire)
    -   id_anime (Clé étrangère référençant la table "Animes")
    -   numéro_episode
    -   titre_episode
    -   durée
    -   date_sortie

<!-- 

CREATE TABLE Episodes (
    id_episode INT PRIMARY KEY AUTO_INCREMENT,
    id_anime INT,
    numero_episode INT NOT NULL,
    titre_episode VARCHAR(255),
    duree TIME,
    date_sortie DATE,
    FOREIGN KEY (id_anime) REFERENCES Animes(id_anime) ON DELETE CASCADE
);


-->

### 5. Création de la Table "Utilisateurs"

-   Créez une table "Utilisateurs" avec les colonnes suivantes :
    -   id_utilisateur (Clé primaire)
    -   nom_utilisateur
    -   email
    -   mot_de_passe

<!-- 

CREATE TABLE Utilisateurs (
    id_utilisateur INT PRIMARY KEY AUTO_INCREMENT,
    nom_utilisateur VARCHAR(50) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    mot_de_passe VARCHAR(255) NOT NULL
);

-->

### 6. Création de la Table "Liste_de_lecture"

-   Créez une table "Liste_de_lecture" avec les colonnes suivantes :
    -   id_liste (Clé primaire)
    -   id_utilisateur (Clé étrangère référençant la table "Utilisateurs")
    -   id_anime (Clé étrangère référençant la table "Animes")
    -   progression

<!-- 

CREATE TABLE Liste_de_lecture (
    id_liste INT PRIMARY KEY AUTO_INCREMENT,
    id_utilisateur INT,
    id_anime INT,
    progression INT DEFAULT 0,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur) ON DELETE CASCADE,
    FOREIGN KEY (id_anime) REFERENCES Animes(id_anime) ON DELETE CASCADE
);


-->

### 7. Création de la Table "Commentaires"

-   Créez une table "Commentaires" avec les colonnes suivantes :
    -   id_commentaire (Clé primaire)
    -   id_utilisateur (Clé étrangère référençant la table "Utilisateurs")
    -   id_anime (Clé étrangère référençant la table "Animes")
    -   contenu
    -   date_commentaire

<!-- 

CREATE TABLE Commentaires (
    id_commentaire INT PRIMARY KEY AUTO_INCREMENT,
    id_utilisateur INT,
    id_anime INT,
    contenu TEXT NOT NULL,
    date_commentaire DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_utilisateur) REFERENCES Utilisateurs(id_utilisateur) ON DELETE CASCADE,
    FOREIGN KEY (id_anime) REFERENCES Animes(id_anime) ON DELETE CASCADE
);


-->

# Afficher les tables :

show tables;

### 8. Insertion de Données

-   Insérez des données dans la table "Animes".

INSERT INTO Animes (titre, studio_production, annee_sortie, genre, description, note) 
VALUES
    ('Naruto', 'Studio Pierrot', 2002, 'Action', 'Un ninja adolescent cherche à devenir Hokage.', 8.5),
    ('One Piece', 'Toei Animation', 1999, 'Aventure', 'Un garçon au chapeau de paille veut devenir le roi des pirates.', 9.0),
    ('Attack on Titan', 'Wit Studio', 2013, 'Action', 'Des humains combattent des géants mangeurs d\'hommes.', 8.8);

# Voir les donnée

select * from Animes;


-   Insérez des données dans la table "Episodes".

INSERT INTO Episodes (id_anime, numero_episode, titre_episode, duree, date_sortie)
VALUES
    (1, 1, 'Enter: Naruto Uzumaki!', 23, '2002-10-03'),
    (1, 2, 'My Name is Konohamaru!', 23, '2002-10-10'),
    (2, 1, 'I\'m Luffy! The Man Who\'s Gonna Be King of the Pirates!', 25, '1999-10-20'),
    (2, 2, 'Enter the Great Swordsman! Pirate Hunter Roronoa Zoro!', 25, '1999-11-17'),
    (3, 1, 'To You, in 2000 Years: The Fall of Shiganshina, Part 1', 24, '2013-04-07'),
    (3, 2, 'That Day: The Fall of Shiganshina, Part 2', 24, '2013-04-14');

# Voir les donnée

select * from Episodes;

-   Insérez des données dans la table "Utilisateurs".

INSERT INTO Utilisateurs (nom_utilisateur, email, mot_de_passe)
VALUES
    ('johndoe', 'johndoe@example.com', 'password123'),
    ('janedoe', 'janedoe@example.com', 'password123'),
    ('animefan', 'animefan@example.com', 'password123');

# Voir les donnée

select * from Utilisateurs;

-   Insérez des données dans la table "Liste_de_lecture".

INSERT INTO Liste_de_lecture (id_utilisateur, id_anime, progression)
VALUES
    (1, 1, 5),
    (1, 2, 10),
    (2, 3, 12),
    (3, 1, 3);

# Voir les donnée

select * from Liste_de_lecture;


-   Insérez des données dans la table "Commentaires".

INSERT INTO Commentaires (id_utilisateur, id_anime, contenu, date_commentaire)
VALUES
    (1, 1, 'Amazing first episode!', '2023-01-15'),
    (2, 2, 'Can\'t wait for the next episode!', '2023-01-20'),
    (3, 3, 'This anime is so intense!', '2023-01-25');

# Voir les donnée

select * from Commentaires;


### 9. Requêtes SQL

-   Affichez tous les enregistrements de la table "Animes".

# SELECT * FROM Animes;


-   Affichez les titres des animes qui appartiennent au genre "Action".


# SELECT titre FROM Animes WHERE genre = 'Action';

-   Affichez le nombre total d'épisodes pour chaque anime.

<!-- 

SELECT a.titre, COUNT(e.id_episode) AS nombre_d_episodes
FROM Animes a
LEFT JOIN Episodes e ON a.id_anime = e.id_anime
GROUP BY a.id_anime, a.titre; 

-->

-   Affichez les noms des utilisateurs et les animes dans leurs listes de lecture.


<!-- 

SELECT u.nom_utilisateur, a.titre
FROM Liste_de_lecture l
JOIN Utilisateurs u ON l.id_utilisateur = u.id_utilisateur
JOIN Animes a ON l.id_anime = a.id_anime;

 -->


-   Affichez les commentaires pour chaque anime avec le nom de l'utilisateur et la date du commentaire.

<!-- 

SELECT a.titre AS anime_titre, u.nom_utilisateur, c.contenu, c.date_commentaire
FROM Commentaires c
JOIN Utilisateurs u ON c.id_utilisateur = u.id_utilisateur
JOIN Animes a ON c.id_anime = a.id_anime
ORDER BY a.titre, c.date_commentaire;


 -->


-   Affichez les animes avec une note moyenne supérieure à 8, triés par note décroissante et limitez les résultats à 5.

<!-- 

SELECT titre, note
FROM Animes
WHERE note > 8
ORDER BY note DESC
LIMIT 5;

 -->


-   Affichez les utilisateurs et le nombre d'animes dans leurs listes de lecture, triés par nombre d'animes décroissant.

<!-- 

SELECT u.nom_utilisateur, COUNT(l.id_anime) AS nombre_animes
FROM Utilisateurs u
LEFT JOIN Liste_de_lecture l ON u.id_utilisateur = l.id_utilisateur
GROUP BY u.id_utilisateur, u.nom_utilisateur
ORDER BY nombre_animes DESC;


 -->


-   Affichez les 3 épisodes les plus longs avec le nom de l'anime et la durée de l'épisode.

<!-- 

SELECT a.titre AS anime_titre, e.titre_episode, e.duree
FROM Episodes e
JOIN Animes a ON e.id_anime = a.id_anime
ORDER BY e.duree DESC
LIMIT 3;



 -->


-   Affichez les utilisateurs ayant laissé au moins 5 commentaires, triés par nombre de commentaires décroissant.


INSERT INTO Commentaires (id_utilisateur, id_anime, contenu, date_commentaire)
VALUES
    (1, 1, 'Great continuation of the story!', '2023-02-01'),
    (1, 2, 'I love the character development!', '2023-02-05'),
    (1, 3, 'Exciting episode!', '2023-02-10'),
    (2, 1, 'Really enjoyed the plot twist.', '2023-02-15'),
    (2, 2, 'Can\'t wait for the next season!', '2023-02-20'),
    (2, 3, 'Fantastic episode!', '2023-02-25'),
    (3, 1, 'The animation was top-notch!', '2023-03-01'),
    (3, 2, 'Interesting character arcs.', '2023-03-05'),
    (3, 3, 'Amazing storyline!', '2023-03-10');


<!-- 

SELECT u.nom_utilisateur, COUNT(c.id_commentaire) AS nombre_commentaires
FROM Utilisateurs u
JOIN Commentaires c ON u.id_utilisateur = c.id_utilisateur
GROUP BY u.id_utilisateur, u.nom_utilisateur
HAVING COUNT(c.id_commentaire) >= 5
ORDER BY nombre_commentaires DESC;

 -->


-   Affichez les animes et leur nombre total d'épisodes diffusés après 2020, triés par nombre d'épisodes décroissant.

<!-- 

SELECT a.titre AS titre_anime, COUNT(e.id_episode) AS nombre_episodes
FROM animes a
JOIN episodes e ON a.id_anime = e.id_anime
WHERE e.date_sortie > '2020-01-01'
GROUP BY a.id_anime, a.titre
ORDER BY nombre_episodes DESC;


 -->

## Exercice

Créez la base de données et les tables selon les instructions ci-dessus. Insérez des données fictives et effectuez les requêtes SQL demandées. Vous pouvez personnaliser les données et les requêtes en fonction de vos préférences.

