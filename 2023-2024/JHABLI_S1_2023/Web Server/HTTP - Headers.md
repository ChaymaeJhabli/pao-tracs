# Challenges

## Serveur Web

### HTTP - Headers :

## Problème:
Pour résoudre le challenge "HTTP - Headers" on démarre le challenge 

## Étape 1 : Problème identifié 

En lançant le défi, vous rencontrerez le message : "Content is not the only part of an HTTP response!". Il s'agit donc d'un problème lié aux en-têtes (headers) de la réponse HTTP.

## Étape 2 : Résoudre

Utilisant Insomnia avec une requête de type "GET", saisissez le lien de la page qui s'affiche après le démarrage du challenge : "http://challenge01.root-me.org/web-serveur/ch5/". Dans la réponse, consultez les en-têtes (headers) où vous remarquerez le champ "Header-RootMe-Admin" avec une valeur "none".

Dans la requête HTTP, consultez les en-têtes et ajoutez le champ "Header-RootMe-Admin" avec la valeur "admin". Ensuite, envoyez la requête. Voici le résultat obtenu :

``` html
    <html>
    <body><link rel='stylesheet' property='stylesheet' id='s' type='text/css' href='/template/s.css' media='all' /><iframe id='iframe' src='https://www.root-me.org/?page=externe_header'></iframe>
    <p>Content is not the only part of an HTTP response!</p>
    <p>You dit it ! You can validate the challenge with the password HeadersMayBeUseful
    </p></body>
    </html>
```

## Conclusion
Le flag est le suivant : "HeadersMayBeUseful"