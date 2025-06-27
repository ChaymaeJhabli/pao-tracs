# Challenges

## Serveur Web

### JWT - Introduction :

## Problème:
Pour résoudre le challenge "JWT - Introduction" on démarre le challenge 

## Étape 1 : Extraire JWt

Commencez le défi et vous rencontrerez une boîte d'inscription (sign up) ainsi qu'une option pour se connecter en tant qu'invité (Login as guest).
En inspectant le code, vérifiez l'application, puis examinez les cookies. Lorsque vous essayez de vous inscrire (sign up), rien de nouveau n'est ajouté aux cookies.
Cependant, en sélectionnant "Login as Guest" (Se connecter en tant qu'invité), vous remarquerez qu'une nouvelle ligne est ajoutée aux cookies (le token) :

jwt eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VybmFtZSI6Imd1ZXN0In0.OnuZnYMdetcg7AWGV6WURn8CFSfas6AQej4V9M13nsk

Notre Token se compose de trois parties :

Header : eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9 (encodage en base 64)
Payload : eyJ1c2VybmFtZSI6Imd1ZXN0In0 (encodage en base 64)
Signature : OnuZnYMdetcg7AWGV6WURn8CFSfas6AQej4V9M13nsk (encodage en base 64)

## Étape 2 : Résoudre

Nous avons consulté un site web analyseur de JWT, j'ai utilisé le site ("https://fusionauth.io/dev-tools/jwt-decoder"), j'ai entré la valeur dans le champ "Token", et j'ai obtenu :

Header:
```  
  {
    "typ": "JWT",
    "alg": "HS256"
    }
 ```


Payload:
```    
   {
  "username": "guest"
   } 
```

Nous avons modifié le nom d'utilisateur en 'admin' et obtenu un nouveau Token . Nous avons remplacé celui-ci dans notre site et actualisé la page.

Après l'actualisation, nous avons reçu "Wrong signature". Cette dernière est précisée par une clé secrète qui encode avec l'algorithme obtenu dans le header : "HS256".

Nous avons revisité le site et avons remplacé l'algorithme par 'none', puis avons copié le Token  obtenu sans la partie de signature.

et voila on obtient notre mot secret:
voilà ce qui s'affiche:
```
Welcome admin to this website! :)

You can validate the challenge with the flag : S1gn4tuR3_v3r1f1c4t10N_1S_1MP0Rt4n7

Click here to logout
```

## Conclusion
Le flag est le suivant : "S1gn4tuR3_v3r1f1c4t10N_1S_1MP0Rt4n7"