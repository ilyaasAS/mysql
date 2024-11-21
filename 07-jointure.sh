# ? Jointures
# ? Une jointure est utilisée pour combiner les lignes de deux ou plusieurs tables, en fonction d'une colonne commune entre elles.

# Voici un exemple de requête SQL utilisant la clause JOIN :

SELECT column_name(s)
FROM table1
INNER JOIN table2
ON table1.column_name = table2.column_name;
