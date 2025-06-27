# Challenges

## WEB - CLIENT

### Javascript - Authentification2

## Problème:

Pour résoudre ce défi, on démarre le challenge puis on cherche le username et le passwd .

## Etape 1 :  le code source qui contient login et pass
La première étape consiste à inspecter le code de la page du défi. Et trouver le code JavaScript qui contient le username et le passwd . Dans notre cas,le code suivant :

```html
<head>
	<title>JS Authentication</title>
	<script language="JavaScript" src="login.js"></script>
</head>

```
On remarque la présence du script login.js dans la balise <head>, ce code contient sûrement une fonction de connexion()(comme son nom l'indique dans le code html)

## Etape 2 : Chercher la fonction de connecxion

Dans la barre en-dessous, nous cliquons sur "search" et tapons "login.js" pour le trouver rapidement sans avoir à aller dans les sources et chercher le fichier manuellement. Une fois trouvé, nous cliquons sur le fichier et voici son contenu :

```js
function connexion(){
    var username = prompt("Username :", "");
    var password = prompt("Password :", "");
    var TheLists = ["GOD:HIDDEN"];
    for (i = 0; i < TheLists.length; i++)
    {
        if (TheLists[i].indexOf(username) == 0)
        {
            var TheSplit = TheLists[i].split(":");
            var TheUsername = TheSplit[0];
            var ThePassword = TheSplit[1];
            if (username == TheUsername && password == ThePassword)
            {
                alert("Vous pouvez utiliser ce mot de passe pour valider ce challenge (en majuscules) / You can use this password to validate this challenge (uppercase)");
            }
        }
        else
        {
            alert("Nope, you're a naughty hacker.")
        }
    }
}
```
En analysant la fonction, nous trouvons  :
`var TheLists = ["GOD:HIDDEN"];`
`var TheUsername = TheSplit[0];`
`var ThePassword = TheSplit[1];`
```js
if (username == TheUsername && password == ThePassword)
            {
                alert("Vous pouvez utiliser ce mot de passe pour valider ce challenge (en majuscules) / You can use this password to validate this challenge (uppercase)");
            }
```

C'est là que nous découvrons la condition d'entrée et donc notre solution.

## Conclusion

On obtient donc le passwd="HIDDEN" qui est notre flag.