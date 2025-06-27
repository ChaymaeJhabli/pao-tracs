# Challenges

## Serveur Web

### HTTP - Cookies :

## Problème:
Pour résoudre le challenge "HTTP - Cookies" on démarre le challenge 

## Étape 1 : Extraire JWt

Pour commencer le défi, vous rencontrerez une boîte pour saisir l'e-mail et consulter les e-mails stockés. Pour consulter les e-mails stockés, il est nécessaire d'être un administrateur.

En inspectant le code, examinez l'application, puis vérifiez les cookies. Lorsque vous essayez de consulter les e-mails stockés, vous remarquerez l'ajout d'une nouvelle ligne aux cookies (un token qui est ajouté) .


## Étape 2 : Résoudre

Il est observé que la valeur du token est 'visiteur'.

Nous avons modifié la valeur en 'admin' et actualisé la page.

Après l'actualisation, nous avons obtenu notre clé recherchée : Validation password : ml-SYMPA

## Conclusion
Le flag est le suivant : "ml-SYMPA"