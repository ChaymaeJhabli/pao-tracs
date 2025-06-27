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

          <script type="text/javascript">
              /* <![CDATA[ */

              pass = '%63%70%61%73%62%69%65%6e%64%75%72%70%61%73%73%77%6f%72%64';
              h = window.prompt('Entrez le mot de passe / Enter password');
              if(h == unescape(pass)) {
                  alert('Password accepté, vous pouvez valider le challenge avec ce mot de passe.\nYou an validate the challenge using this pass.');
              } else {
                  alert('Mauvais mot de passe / wrong password');
              }

              /* ]]> */
          </script>
    </head>

```
En analysant la fonction, nous trouvons  :

` pass = '%63%70%61%73%62%69%65%6e%64%75%72%70%61%73%73%77%6f%72%64'`
la condition pour acceptée le mot de pass est :
`h == unescape(pass)`
Dans le console on execute unescape(pass) et on obtient le mot de pass 'cpasbiendurpassword'



## Conclusion
On entre notre mot de pass et on obtient un message qui dir qu'elle est notre flag rechercher pour valider le challenge.
