# Challenges

## WEB - CLIENT

### Javascript - Source 

## Problème:

Pour résoudre ce défi, on démarre le challenge puis on cherche le mot de pass .

## Etape 1 :  le code source qui contient le mot de pass

La première étape consiste à inspecter le code de la page du défi. Et trouver le code JavaScript qui contient le mot de pass. Dans notre cas,le code suivant :
```html
  <head>
	<script type="text/javascript">
	/* <![CDATA[ */
	    function login(){
		pass=prompt("Entrez le mot de passe / Enter password");
		if ( pass == "123456azerty" ) {
		    alert("Mot de passe accepté, vous pouvez valider le challenge avec ce mot de passe.\nYou can validate the challenge using this password.");  }
		else {
		    alert("Mauvais mot de passe / wrong password !");
		}
	    }
	/* ]]> */
	</script>
    </head>
```
On remarque la présence du la fonction login().

## Etape 2 : Chercher le mot de pass

En analysant la fonction, nous trouvons la ligne suivante :
`if ( pass == "123456azerty" ) { alert("Mot de passe accepté, vous pouvez valider le challenge avec ce mot de passe.\nYou can validate the challenge using this password.");  }`
C'est là que nous découvrons la condition d'entrée et donc notre solution.

## Conclusion

On remplit la barre du mot de passe= "123456azerty" et on obtient notre flag.