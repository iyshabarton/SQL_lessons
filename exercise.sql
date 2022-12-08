Obtenir la liste des 10 villes les plus peuplées en 2012
EX 1 : SELECT ville_population_2012, ville_nom FROM `villes_france_free` ORDER BY ville_population_2012 DESC LIMIT 10;

Obtenir la liste des 50 villes ayant la plus faible superficie
EX 2 : SELECT ville_surface, ville_nom FROM `villes_france_free` ORDER BY ville_surface ASC LIMIT 50;

Obtenir la liste des départements d’outres-mer, c’est-à-dire ceux dont le numéro de département commencent par “97”
EX 3 : SELECT departement_code, departement_nom FROM `departement` WHERE departement_code LIKE '97%';

Obtenir le nom des 10 villes les plus peuplées en 2012, ainsi que le nom du département associé
EX 4 : 
SELECT * FROM `villes_france_free` 
INNER JOIN departement d 
ON departement_code = ville_departement 
ORDER BY `ville_population_2012`
DESC LIMIT 10;

Obtenir la liste du nom de chaque département, associé à son code et du nombre de 
commune au sein de ces département, en triant afin d’obtenir en priorité les départements qui possèdent le plus de communes
EX 5 : SELECT departement_nom, ville_departement, COUNT(*) 
AS number FROM `villes_france_free` 
INNER JOIN departement
ON departement_code = ville_departement 
GROUP BY ville_departement 
ORDER BY `number`
DESC LIMIT 10;


Obtenir la liste des 10 plus grands départements, en terme de superficie
EX 6 : 
SELECT departement_nom, ville_departement, // We need the departement name and what cities are in a departement;
SUM(`ville_surface`) // sum will calculate the sum of ville_surface
AS dpt_surface // as will rename the sum-total of ville_surface as departement surface 
FROM `villes_france_free` // from the mais table villes_france_free
LEFT JOIN departement 
ON departement_code = ville_departement // this joins the 2 tables 
GROUP BY ville_departement 
ORDER BY dpt_surface DESC LIMIT 10;

Compter le nombre de villes dont le nom commence par “Saint”
EX 7 : SELECT COUNT(*) FROM `villes_france_free` WHERE ville_nom LIKE 'saint%';

Obtenir la liste des villes qui ont un nom existants plusieurs fois, et trier afin d’obtenir en premier
celles dont le nom est le plus souvent utilisé par plusieurs communes
EX 8 : 
SELECT DISTINCT ville_nom, COUNT(ville_commune) // distinct is to regroup the same result
FROM `villes_france_free` 
GROUP BY ville_nom 
HAVING COUNT(ville_commune) > 1 --// pose une condition sur ce que j'ai counter so superieur a 1 doublon;
ORDER BY COUNT(ville_commune) DESC LIMIT 15;

Obtenir en une seule requête SQL la liste des villes dont la superficie est supérieur à la superficie moyenne
EX 9 : 
SELECT ville_nom FROM villes_france_free 
WHERE ville_surface > (SELECT AVG(ville_surface) FROM villes_france_free);

Obtenir la liste des départements qui possèdent plus de 2 millions d’habitants
EX 10 :
SELECT ville_departement, SUM(ville_population_2012) FROM `villes_france_free` 
GROUP BY ville_departement 
HAVING SUM(ville_population_2012) > 2000000;

Remplacez les tirets par un espace vide, pour toutes les villes commençant par “SAINT-” (dans la colonne qui contient les noms en majuscule)
EX 11 : 
SELECT ville_nom, REPLACE(ville_nom, '-', ' ') 
FROM `villes_france_free` 
WHERE ville_nom LIKE '%saint%';