# Exercice avec une Base de Données pour une École

Dans cet exercice, vous allez créer une base de données pour gérer des étudiants, des matières et des notes dans une école.

#? Étapes à Suivre

# ! Connexion à une base de données :

mysql -u root

# ! Afficher les base de données :

show databases;    

# 1. Créez la Base de Données `school_db`

create database school_db;

# 2. Utilisez la Base de Données `school_db`

use school_db

### 3. Créez la Table `student`

id, last_name, frist_name, birthday, adress, email


<!-- 

 CREATE TABLE student (
    id INT PRIMARY KEY AUTO_INCREMENT,
    last_name VARCHAR(50) NOT NULL,
    first_name VARCHAR(50) NOT NULL,
    birthday DATE NOT NULL,
    address VARCHAR(255),
    email VARCHAR(255) UNIQUE NOT NULL
);

 -->

### Voir les tables

show tables;


### 4. Créez la Table `subject`

id, name, description

<!-- 

CREATE TABLE subject (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL,
    description TEXT
);



 -->

### Voir les tables

show tables; 

### 5. Créez la Table `note`

id, student_id, subject_id, note
la table note est liée à la table student
la table note est liée à la table subject


<!-- 

CREATE TABLE note (
    id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    subject_id INT NOT NULL,
    note DECIMAL(5, 2) NOT NULL,
    FOREIGN KEY (student_id) REFERENCES student(id),
    FOREIGN KEY (subject_id) REFERENCES subject(id)
);



 -->

### Voir les tables

show tables;

### 6. Insérez des Données dans les Tables

#### a. Insertion des Étudiants

<!-- 

INSERT INTO student (last_name, first_name, birthday, address, email) VALUES
('Doe', 'John', '2000-01-01', '123 Main Street', 'john.doe@example.com'),
('Smith', 'Emma', '1999-03-15', '456 Elm Street', 'emma.smith@example.com'),
('Johnson', 'Michael', '2001-05-10', '789 Oak Street', 'michael.johnson@example.com'),
('Brown', 'Olivia', '2002-07-20', '321 Pine Street', 'olivia.brown@example.com'),
('Taylor', 'Sophia', '2003-09-25', '654 Maple Street', 'sophia.taylor@example.com'),
('Anderson', 'Liam', '2000-12-05', '987 Cedar Street', 'liam.anderson@example.com'),
('Clark', 'Ava', '1998-02-14', '741 Birch Street', 'ava.clark@example.com'),
('Lewis', 'Noah', '1999-04-30', '852 Walnut Street', 'noah.lewis@example.com'),
('Walker', 'Mia', '2001-06-08', '369 Oakwood Street', 'mia.walker@example.com'),
('Hall', 'Elijah', '2002-08-16', '258 Cherry Street', 'elijah.hall@example.com'); 

-->

# Voir les donnée inserer

SELECT * FROM student;


#### b. Insertion des Matières

<!-- 

INSERT INTO subject (name, description) VALUES
('Mathématiques', 'Calcul et algèbre'),
('Sciences', 'Physique et chimie'),
('Histoire', 'Événements historiques'),
('Français', 'Grammaire et littérature'),
('Anglais', 'Conversation et grammaire'); 

-->


# Voir les donnée inserer

SELECT * FROM subject;

#### c. Insertion des Notes

<!-- 

INSERT INTO note (student_id, subject_id, note) VALUES
(1, 1, 85.50), 
(2, 1, 90.00),  
(3, 2, 78.25),  
(4, 3, 88.75),  
(5, 2, 92.00),  
(6, 1, 79.50),  
(7, 3, 85.00),  
(8, 2, 91.00),  
(9, 1, 88.00),  
(10, 3, 82.50);  

-->


# Voir les donnée inserer

SELECT * FROM note;

---

## Requêtes SQL

### 1. Sélectionner Tous les Étudiants Dont le Nom est "Doe"

SELECT * FROM student WHERE last_name LIKE 'Doe';

SELECT * FROM student WHERE last_name LIKE '%Doe%';



### 2. Sélectionner Tous les Étudiants Âgés de Moins de 20 Ans

SELECT * FROM student
DATEDIFF(YEAR, date_naissance, curdate())

SELECT * FROM student
WHERE YEAR(CURDATE()) - YEAR(birthday) < 20;

SELECT * FROM student
WHERE TIMESTAMPDIFF(YEAR, birthday, CURDATE()) < 20;



### 3. Sélectionner les 5 Premiers Étudiants dans l'Ordre Alphabétique des Noms

SELECT * FROM student ORDER BY last_name ASC LIMIT 5;

SELECT * FROM student ORDER BY last_name ASC, first_name ASC LIMIT 5;


### 4. Sélectionner les Étudiants par Ordre Décroissant de Leur Date de Naissance

SELECT * FROM student ORDER BY birthday DESC;


### 5. Sélectionner les Étudiants Dont l'Adresse Contient le Mot "Street" et Limiter les Résultats à 3

SELECT * FROM student WHERE address LIKE '%Street%';

### 6. Sélectionner les Étudiants Dont le Nom Commence par "S" et Trier les Résultats par Prénom

SELECT * FROM student WHERE last_name LIKE 'S%';

SELECT * FROM student WHERE last_name LIKE 'S%' ORDER BY first_name ASC;


---

## Requêtes Avancées

### 1. Sélectionner la Note Minimale, Maximale et le Nombre Total de Notes pour Chaque Matière

SELECT * FROM note  WHERE note min and max;

SELECT subject_id, 
       MIN(note) AS min_note, 
       MAX(note) AS max_note, 
       COUNT(note) AS total_notes
FROM note
GROUP BY subject_id;


SELECT subject.name, 
       MIN(note.note) AS min_note, 
       MAX(note.note) AS max_note, 
       COUNT(note.note) AS total_notes
FROM note
JOIN subject ON note.subject_id = subject.id
GROUP BY subject.name;



### 2. Sélectionner les Étudiants Ayant une Moyenne Supérieure à 15

SELECT student_id, AVG(note) AS average_note
FROM note
GROUP BY student_id
HAVING AVG(note) > 15;

SELECT student.first_name, student.last_name, AVG(note.note) AS average_note
FROM note
JOIN student ON note.student_id = student.id
GROUP BY student.id
HAVING AVG(note.note) > 15;

### 3. Sélectionner le Nombre d'Étudiants Ayant Obtenu une Note Supérieure à 16 dans Chaque Matière

SELECT subject.name, COUNT(note.student_id) AS student_count
FROM note
JOIN subject ON note.subject_id = subject.id
WHERE note.note > 16
GROUP BY subject.name;

SELECT subject_id, COUNT(student_id) AS student_count
FROM note
WHERE note > 16
GROUP BY subject_id;


### 4. Sélectionner les Matières Ayant au Moins Cinq Étudiants

SELECT subject_id, COUNT(student_id) AS student_count
FROM note
GROUP BY subject_id
HAVING COUNT(student_id) >= 5;

SELECT subject.name, COUNT(note.student_id) AS student_count
FROM note
JOIN subject ON note.subject_id = subject.id
GROUP BY subject.name
HAVING COUNT(note.student_id) >= 5;

### 5. Sélectionner les Étudiants Ayant Obtenu une Note Maximale dans Chaque Matière

SELECT subject_id, MAX(note) AS max_note
FROM note
GROUP BY subject_id;

SELECT note.student_id, note.subject_id, note.note
FROM note
JOIN (
    SELECT subject_id, MAX(note) AS max_note
    FROM note
    GROUP BY subject_id
) AS max_notes
ON note.subject_id = max_notes.subject_id
AND note.note = max_notes.max_note;

SELECT student.first_name, student.last_name, subject.name AS subject_name, note.note
FROM note
JOIN (
    SELECT subject_id, MAX(note) AS max_note
    FROM note
    GROUP BY subject_id
) AS max_notes
ON note.subject_id = max_notes.subject_id
AND note.note = max_notes.max_note
JOIN student ON note.student_id = student.id
JOIN subject ON note.subject_id = subject.id;

---

## Requête Complexe

### Sélectionner le nombre d'Étudiants Dont la Date de Naissance est Postérieure au 1er Janvier 2000, Groupe les Résultats par matière, Filtre les Groupes Ayant Plus de 2 Étudiants, Trie les Résultats par Nom de matière et Limite les Résultats à 10


SELECT subject.name AS subject_name, COUNT(DISTINCT note.student_id) AS student_count
FROM student
JOIN note ON student.id = note.student_id
JOIN subject ON note.subject_id = subject.id
WHERE student.birthday > '2000-01-01'
GROUP BY subject.name
HAVING COUNT(DISTINCT note.student_id) > 2
ORDER BY subject.name ASC
LIMIT 10;



### Sélectionner le Nom, le Prénom, le Nom de la Matière et la Note Maximale pour Chaque Étudiant Dont la Date de Naissance est Postérieure au 1er Janvier 2000, Groupe les Résultats par Nom d'Étudiant, Filtre les Groupes Ayant une Note Maximale Supérieure à 2

SELECT student.first_name, student.last_name, subject.name AS subject_name, MAX(note.note) AS max_note
FROM student
JOIN note ON student.id = note.student_id
JOIN subject ON note.subject_id = subject.id
WHERE student.birthday > '2000-01-01'
GROUP BY student.id, student.first_name, student.last_name, subject.name
HAVING MAX(note.note) > 2;




