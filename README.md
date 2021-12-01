# PROJET 7 - OPENCLASSROOMS - DEVELOPPEUR WEB

## Groupomania - Réseau social d'entreprise

<h3>- Compétences évaluées :</h3>
<ul>
  <li>  Authentifier un utilisateur et maintenir sa session</li>
  <li>  Personnaliser le contenu envoyé à un client web</li>
  <li>  Gérer un stockage de données à l'aide de SQL</li>
  <li>  Implémenter un stockage de données sécurisé en utilisant SQL</li>
</ul>

### - Technologies utilisées :
NodeJs - VueJs - MySQL - Bootstrap - Sass
  
## INSTALLATION
### Prérequis :
Il vous faut avoir installé sur votre machine :

<ul>
  <li> Git : https://git-scm.com/downloads</li>
  <li> Node.js : https://nodejs.org/en/</li>
  <li> MySql :  https://dev.mysql.com/downloads/installer/</li>
</ul>

Créer un dossier vide puis cloner ce repository à l'intérieur : 

```
https://github.com/ThomasL9731/Groupomania.git
```
## MySQL
Dans le fichier groupomania/backend/.env ,mettre le mot de passe d'accès à votre base de donnée et votre nom d'utilisateur si besoin (root par défaut)
```
DB_USER=root
DB_PASS=
```
Ouvrir MySql command Line client puis effectuer ces deux lignes de commandes :
```
CREATE DATABASE groupomania;
USE groupomania;
```
Importer le fichier groupomania.sql (qui ce trouve a la racine du projet) : 
```
source (chemin vers le fichier groupomania.sql);
```
Attention a indiquer le chemin avec des "/" et non des "\ ".

## BACK END
Ouvrir un terminal dans le dossier backend puis effectuer les lignes de commandes suivantes :
```
npm install
node server
```
## FRONT END
Ouvrir un autre terminal dans le dossier frontend puis effectuer les lignes de commandes suivantes :
```
npm install
npm run serve
```

Ouvrir le navigateur a l'adresse http://localhost:8080/

### Fonctionnalités :
Le site permet de
<ul>
  <li>Partager des posts (avec ou sans photos)</li>
  <li>Commenter et liker des posts</li>
  <li>Personnaliser son profil (changement de photo de profil, description...)</li>
  <li>Modifier et supprimer son compte</li>
</ul>

Un compte admin est présent pour la modération (suppression des posts et commentaires d'autres utilisateurs).
<br>
Voici les codes d'accès admin :
```
admin@admin.com
Admin.31
```

Bonne visite !

