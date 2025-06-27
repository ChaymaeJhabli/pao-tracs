## Challenges

### Serveur Web

### Challenge: API - Broken Access

#### Problème

Cette épreuve vous propose de vérifier que tout est sécurisé avant de mettre en place le Front-End.

#### Etape1: Creer un User 

Dans cette étape, nous démarrons le défi. Dans la partie api/sign-up, cliquez sur "try out" et remplissez les informations du nouvel utilisateur demandées.

```
{
  "username": "Chayma",
  "password": "Chama"
}
```
Ensuite, cliquez sur "Execute". Un message s'affiche : 

```
{
  "message": "User created successfully"
}
```
Dans la partie api/login, cliquez sur "try out" et remplissez les informations du nouvel utilisateur demandées. 

```
{
  "username": "Chayma",
  "password": "Chama"
}
```
Ensuite, cliquez sur "Execute". Un message s'affiche : 

```
{
  "message": "Logged in successfully"
}
```
Ainsi, l'utilisateur existe et peut se connecter correctement.

#### Etape2: Résolution 

Dans la partie api/user, cliquez sur "try out"  et remplissez les informations demandées pour l'identifiant utilisateur (remplissez-en 1 au hasard). Ensuite, cliquez sur "Execute". Une URL s'affiche : 

```
   http://challenge01.root-me.org:59088/api/user
```
Donc, c'est une URL qui semble intéressante. Accédez à l'endpoint /api/user/1 dans une nouvelle fenêtre de navigateur. Vous obtiendrez les informations suivantes :
```
{
  "note": "RM{E4sy_1d0r_0n_API}",
  "userid": 1,
  "username": "admin"
}
``` 

**NB :** Si l'utilisateur n'est pas connecté, on ne peut pas accéder à cette page.


#### Solution

Le flag est la note de l'utilisateur admin : `RM{E4sy_1d0r_0n_API}`.