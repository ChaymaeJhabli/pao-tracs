# Challenges

## WEB - CLIENT

### Javascript - Authentification

## Problème:

Pour résoudre ce défi, on démarre le challenge puis on cherche un Login et pass .

## Etape 1 :  le code source qui contient login et pass

La première étape consiste à inspecter le code de la page du défi. En réalité, le code JavaScript peut être contenu à la fois dans la balise <head> et <body> d'une page web. Il peut être écrit dans un fichier séparé, et son lien peut être trouvé dans la balise <head>. Cependant, il peut également être inséré directement dans la balise <head> ou <body> de la page. Dans notre cas,le code suivant :
```html
<html>
    <head>
        <script type="text/javascript" src="login.js"></script>
    </head>
    <body>
        <form name="login" method="POST" action="">
            Username : <input name="pseudo" /><br/>
            Password : <input type="password" name="password" /><br/><br/>
            <input onclick="Login()" type="button" value="login" name="button" />
        </form>
    </body>
</html>

```
On remarque la présence du script login.js dans la balise <head>, et dans le formulaire, il y a un appel à une fonction Login()

## Etape 2 : Chercher la fonction de Login

Dans la barre en-dessous, nous cliquons sur "search" et tapons "login.js" pour le trouver rapidement sans avoir à aller dans les sources et chercher le fichier manuellement. Une fois trouvé, nous cliquons sur le fichier et voici son contenu :

```js
function Login(){
	var pseudo=document.login.pseudo.value;
	var username=pseudo.toLowerCase();
	var password=document.login.password.value;
	password=password.toLowerCase();
	if (pseudo=="4dm1n" && password=="sh.org") {
	    alert("Password accepté, vous pouvez valider le challenge avec ce mot de passe.\nYou an validate the challenge using this password.");
	} else { 
	    alert("Mauvais mot de passe / wrong password"); 
	}
}
```
En analysant la fonction, nous trouvons la ligne suivante :
`if (pseudo=="4dm1n" && password=="sh.org")`
C'est là que nous découvrons la condition d'entrée et donc notre solution.

## Conclusion

On remplit le form avec le pseudo= "4dm1n" et le mot de passe="sh.org" et on obtient notre flag.