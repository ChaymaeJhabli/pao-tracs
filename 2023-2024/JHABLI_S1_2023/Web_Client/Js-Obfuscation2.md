# Challenges

## WEB - CLIENT

### Javascript - Obfuscation 1

## Problème:

Pour résoudre ce défi, on démarre le challenge puis on cherche le password .

## Etape 1 :  le code source qui contient le password
La première étape consiste à inspecter le code de la page du défi. Et trouver le code JavaScript qui contient le passwd . Dans notre cas,le code suivant :

```html
    <head>
        <title>Obfuscation JS</title>
    <!-- 
    Obfuscation 
    .Niveau : Facile 
    .By Hel0ck
    .The mission : 
        Retrouver le password contenu dans la var pass.
        You need my help ? IRC : irc.root-me.org #root-me
    -->
    <script type="text/javascript">
        var pass = unescape("unescape%28%22String.fromCharCode%2528104%252C68%252C117%252C102%252C106%252C100%252C107%252C105%252C49%252C53%252C54%2529%22%29");
    </script>
    </head>

```
En analysant la fonction, nous trouvons  :

` pass = 'unescape%28%22String.fromCharCode%2528104%252C68%252C117%252C102%252C106%252C100%252C107%252C105%252C49%252C53%252C54%2529%22%29'`
la condition pour acceptée le mot de pass est :
`h == unescape(pass)`
Dans le console on execute unescape(pass) et on obtient: 
` unescape("String.fromCharCode(104,68,117,102,106,100,107,105,49,53,54)") `
puis dans le console on réexécute:
`unescape(String.fromCharCode(104,68,117,102,106,100,107,105,49,53,54))`
et on obtient notre mot de pass: 'hDufjdki156'




## Conclusion
On entre notre mot de pass et on obtient un message qui dir qu'elle est notre flag rechercher pour valider le challenge.
