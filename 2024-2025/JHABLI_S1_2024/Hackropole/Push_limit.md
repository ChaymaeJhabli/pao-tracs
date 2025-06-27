# Challenge: Push it to the Limit

## Description
Ce challenge consiste à interagir avec une application web via un conteneur Docker pour contourner l'authentification en utilisant des injections SQL.

## Instructions

1. **Télécharger le fichier Docker Compose :**
   Exécutez la commande suivante dans votre terminal pour télécharger le fichier `docker-compose.yml` :
   ```bash
   curl https://hackropole.fr/challenges/fcsc2021-web-push-it-to-the-limit/docker-compose.public.yml -o docker-compose.yml
   ```
## Lancer l'épreuve

Dans le même dossier que le fichier téléchargé, exécutez la commande suivante :

```bash
docker compose up
```
## Interagir avec l'application :

Vous devriez voir une interface de connexion demandant un nom d'utilisateur et un mot de passe. 
Après avoir inspecté le code source de la page, vous ne remarquez rien d'inhabituel.

## Injection:

Vous pouvez essayer d'injecter du code SQL dans le champ de connexion pour contourner l'authentification. 
Dans le champ "Nom d'utilisateur", essayez la chaîne suivante :

```lua
 admin OR 1=1; --
```

Dans le champ "Mot de passe", vous pouvez mettre n'importe quoi, car si l'utilisateur admin existe, il sera affiché. Sinon, avec la condition OR 1=1, cela renverra un utilisateur valide. Le -- commente la suite de la requête SQL.

Cependant, vous obtiendrez toujours le message "Identifiants incorrects."

Pour une deuxième fois, inspectez le code après cette injection et voici ce que vous trouverez dans le body après la balise de formulaire :

```html
 <!-- SELECT * FROM users WHERE username="admin OR 1=1; --" AND password="a" -->
```
Ici, nous remarquons que dans le code de l'application, il y a username=", donc dans notre injection, nous devons fermer ces doubles guillemets en commençant par ". De plus, comme il y a un SELECT *, nous devons nous limiter à un seul utilisateur. C'est pourquoi vous pouvez essayer de réinjecter dans le nom d'utilisateur :

```lua
 " OR 1=1 LIMIT 1 --
```
Et dans le mot de passe, mettez n'importe quoi. Avec cette injection, vous devriez obtenir le flag.

## Flag

Le flag est de la forme `FCSC{5012fb37d7886deaa5c4e209cf683286}`.