# Exercice SQL : Création et gestion de 3 tables

# Contexte :

Vous êtes chargé de créer une base de données pour une bibliothèque. Cette base devra gérer les informations relatives aux livres, aux auteurs et aux emprunts effectués par les clients. Vous allez créer les trois tables avec les champs nécessaires, puis effectuer des modifications telles que l'ajout, la suppression, et le renommage de colonnes.

# Objectifs de l'exercice :

Créer trois tables en utilisant les types de données appropriés.
Modifier des champs (changer le type ou la taille).
Ajouter, renommer et supprimer des colonnes dans les tables.
Utiliser les relations entre les tables (clés étrangères).

---

# ! // Étapes à suivre

Afficher les base de données :

# show databases

Création de la base de données
Créez une base de données appelée library.

# create database library


Sélectionner la base de données
Assurez-vous d'utiliser la base de données library avant de commencer la création des tables.

# use library

voir les tables

# SHOW TABLES;

_____
Créer la table authors
Cette table contiendra les informations sur les auteurs. Chaque auteur aura un identifiant unique et un nom complet.


<!-- 

CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    full_name VARCHAR(255) NOT NULL
);


-->voir les tables

# SHOW TABLES;
# DESCRIBE authors;


Créer la table books
Cette table contiendra les informations sur les livres. Chaque livre aura un identifiant unique, un titre, une année de publication, et une référence à l'auteur via une clé étrangère.

<!-- 

CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    publication_year INT NOT NULL,
    author_id INT,
    FOREIGN KEY (author_id) REFERENCES authors(author_id) ON DELETE CASCADE
);

-->

voir les tables

# SHOW TABLES;
# DESCRIBE books;



Créer la table loans
Cette table contiendra les informations sur les emprunts de livres par des clients. Chaque emprunt aura un identifiant unique, une date d'emprunt, une date de retour prévue, et une référence au livre emprunté.

<!-- 

CREATE TABLE loans (
    loan_id INT AUTO_INCREMENT PRIMARY KEY,
    loan_date DATE NOT NULL,
    return_date DATE NOT NULL,
    book_id INT,
    FOREIGN KEY (book_id) REFERENCES books(book_id) ON DELETE CASCADE
);


-->

voir les tables

# SHOW TABLES;
# DESCRIBE loans;


---
Modifications à effectuer :
Modifier la table books pour changer la taille de la colonne title
Supposons que vous voulez permettre des titres de livres plus longs. Modifiez la taille de la colonne title dans la table books pour qu'elle accepte jusqu'à 200 caractères.

# ALTER TABLE books MODIFY title VARCHAR(200);

voir les tables

# SHOW TABLES;
# DESCRIBE books;



Ajouter une colonne ISBN à la table books
Ajoutez une colonne ISBN pour stocker le numéro unique international des livres.

# alter table books add ISBN VARCHAR(13) UNIQUE;
# ALTER TABLE books ADD COLUMN ISBN VARCHAR(13) UNIQUE;

voir les tables

# SHOW TABLES;
# DESCRIBE books;

Renommer une colonne dans la table authors
Renommez la colonne full_name en author_name pour une meilleure clarté.

# ALTER TABLE authors CHANGE full_name author_name VARCHAR(255) NOT NULL;

voir les tables

# SHOW TABLES;
# DESCRIBE authors;


Supprimer la colonne return_date dans la table loans
Supposons que l'information sur la date de retour n'est plus pertinente. Supprimez la colonne return_date dans la table loans.

# ALTER TABLE loans DROP COLUMN return_date;

voir les tables

# SHOW TABLES;
# DESCRIBE loans;

Ajouter des données dans les tables


# Ajouter 5 auteurs 

<!-- 

INSERT INTO authors (author_name) VALUES
('J.K. Rowling'),
('George R.R. Martin'),
('J.R.R. Tolkien'),
('Agatha Christie'),
('Isaac Asimov');

 -->

voir les données

 # SHOW TABLES;
# DESCRIBE authors;
# SELECT * FROM authors;


# Ajouter 10 livres

 <!-- 
 
 INSERT INTO books (title, publication_year, author_id, ISBN) VALUES
('Harry Potter and the Sorcerer\'s Stone', 1997, 1, '9780439708180'),
('A Game of Thrones', 1996, 2, '9780553103540'),
('The Hobbit', 1937, 3, '9780345339683'),
('Murder on the Orient Express', 1934, 4, '9780062073501'),
('Foundation', 1951, 5, '9780553293357'),
('Harry Potter and the Chamber of Secrets', 1998, 1, '9780439064873'),
('A Clash of Kings', 1999, 2, '9780553108032'),
('The Two Towers', 1954, 3, '9780547928210'),
('And Then There Were None', 1939, 4, '9780062073488'),
('I, Robot', 1950, 5, '9780553294385'); 

-->

voir les données


# SHOW TABLES;
# DESCRIBE books;
# SELECT * FROM books;

# Ajouter 5 emprunts

<!-- 

INSERT INTO loans (loan_date, book_id) VALUES
('2024-01-10', 1),
('2024-01-12', 2),
('2024-01-15', 3),
('2024-01-18', 4),
('2024-01-20', 5); 

-->

voir les données

# SHOW TABLES;
# DESCRIBE loans;
# SELECT * FROM loans;

Donner une condition

# SELECT * FROM authors WHERE author_id<=3;

# SELECT * FROM authors WHERE author_id>= 1 AND author_id < 3;

# SELECT * FROM authors WHERE author_id = 1;

___________________________________________________________________________


# Je veux recuperer tous les livre paru en 1983

SELECT * FROM books WHERE publication_year=1983;

# Je veux recuperer tous les livre après 1983

SELECT * FROM books WHERE publication_year>1983;

# Je veux recuperer tous les livre entre 1960 et 1980

SELECT * FROM books WHERE publication_year>1960 AND publication_year<1980;

# Je veux recuperer tous les livre triès par date de parution

SELECT * FROM books WHERE year BETWEEN 1960 AND 1980;


# Je veux recuperer tous les livre qui contiennent la lettre a dans leur titre

SELECT * FROM books WHERE title LIKE '%a%';



# Je veux recuperer tous les livre paruent en 1960, 1970 et 1987

SELECT * FROM books WHERE publication_year IN (1960, 1970, 1987);

# Je veux recuperer tous les livre qui contiennent PAS la lettre a dans leur titre

SELECT * FROM books WHERE title NOT LIKE '%a%';

# Je veux recuperer tous les livre qui contiennent la lettre a dans leur titre

SELECT * FROM books WHERE title LIKE '%a%';

# Je veux recuperer tous les livre triès par odre décroissant de date de parution

SELECT * FROM books ORDER BY publication_year DESC;


# Je veux recuperer tous les 3 premiers livres


SELECT * FROM books LIMIT 3;

# Je veux recuperer tous les livre qui ne sont PAS paruent en 1983

SELECT * FROM books WHERE publication_year != 1983;

SELECT * FROM books WHERE publication_year <> 1983;


# Je veux recuperer tous les livre qui ne sont PAS paruent en 1960, 1970, 1987

SELECT * FROM books WHERE publication_year NOT IN (1960, 1970, 1987);


___________________________________________________________________________________________________

