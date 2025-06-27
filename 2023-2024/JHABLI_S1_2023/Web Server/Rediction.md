# Challenges

## Serveur Web

### HTTP - Open redirect :

## Problème:
Pour résoudre le challenge "HTML - open redirect", il est nécessaire de rediriger l'un des liens correspondant à l'un des réseaux sociaux vers une autre page.

## Étape 1 : Trouver le code source

La première étape consiste à inspecter le code de la page, puis à se rendre dans le tag "body" pour rechercher les balises contenant les liens.
Dans le code source de la page HTML, nous choisissons de montrer le code suivant pour Twitter :

```html
<a href='?url=https://twitter.com&h=be8b09f7f1f66235a9c91986952483f0'>Twitter</a>
```
Nous observons donc une URL contenant un hash.

Lorsque l'on essaie de cliquer sur le lien dans la page, nous sommes redirigés vers le site de Twitter.

## Étape 2 : Rediriger
Dans l'URL, nous avons le lien du site web suivi de "&h=", ce qui représente le hash du lien de Twitter.

En utilisant un site générateur de hash (par exemple : "https://fr.rakko.tools/tools/10/"), nous remarquons que le hash "be8b09f7f1f66235a9c91986952483f0" est bien associé à "https://twitter.com" avec la fonction de hashage MD5.

Pour effectuer la redirection, nous remplaçons l'un de nos sites web par celui souhaité, puis nous générons son hash (par exemple : <a href='?url=https://www.insa-rouen.fr&h=b82668b525dddfd877ae0cb212b027ba'>Twitter</a>)."Dans le tag, le nom reste "Twitter", mais en cliquant dessus, nous serons redirigés vers le site de l'INSA."

## Conclusion
Lorsque l'on clique sur le nouveau lien, nous sommes correctement redirigés vers une page contenant le flag.