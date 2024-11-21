# Mettre en pratique les droits administrateurs

-   creer un utilisateur qui aura votre nom qui peut se connecter en localhost

# Afficher les utilisateurs :

   SELECT user, host FROM mysql.user;

# Créer un utilisateur :
   
CREATE USER 'ilyaas'@'localhost' IDENTIFIED BY 'Ilyaas@2003554';

-   affichez la liste des utilisateurs

# Afficher les utilisateurs :

SELECT user, host FROM mysql.user;


-   connectez vous avec lui et affichez la liste des bdd

mysql -u ilyaas -p

-   donnez lui le droit de faire des select sur la table student dans school_db

# Accorder des privilèges à un utilisateur :

GRANT select ON school_db.student TO 'ilyaas'@'%';

-   connectez vous avec lui et affichez a nouveau la liste des bdd




-   utilisez la bdd school_db et affichez les tables



-   affichez les données de la table student



-   essayez de suprimer les données



-   supprimer l'utilisateur que vous avez créé



-   affichez la liste des utilisateurs

