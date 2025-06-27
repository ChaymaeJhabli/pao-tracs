# Challenges

## Serveur Web

### HTTP - Verb tampering:

## Problème:
Pour résoudre le challenge "HTTP - Directory indexing" on démarre le challenge 

## Résoudre

Le problème de ce challenge est lié aux verbes HTTP. Nous aurons besoin d'Insomnia (ou Postman) pour le résoudre.

Copiez le lien du challenge : "http://challenge01.root-me.org/web-serveur/ch8//" et collez-le dans Insomnia. Ensuite, testez l'envoi de la requête HTTP avec différents verbes tels que "GET", "POST", "PUT"...

Effectivement, lorsque nous essayons avec le verbe "PUT", nous obtenons dans la réponse :

Mot de passe / password : a23e$dme96d3saez$$prap


## Conclusion
Le flag est le suivant : "a23e$dme96d3saez$$prap"