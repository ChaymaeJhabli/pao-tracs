## Challenges

### Web Client

### Challenge: Javascript - Webpack

#### Problème

Le challenge consiste à extraire des informations des fichiers dans le contexte de Webpack.
#### Résolution: 

Nous démarrons le défi:

##### Analyse initiale du code source:

Pour commencer, il est important d'inspecter le code source pour comprendre la structure du projet et identifier les fichiers pertinents.

##### Navigation dans les sources:

Dans le répertoire "sources", nous nous dirigeons vers la section "page" où le code pertinent pour ce défi est susceptible de se trouver.

##### Exploration des fichiers JavaScript:

À l'intérieur du dossier "web client", nous accédons au sous-dossier "static", puis à son sous-dossier "js" où résident les fichiers JavaScript.
Nous examinons le fichier "app.a92c5074dafac0cb6365.js".

##### Identification d'un point d'intérêt:

Dans ce fichier JavaScript, nous trouvons un commentaire spécial :

```javascript
//# sourceMappingURL=app.a92c5074dafac0cb6365.js.map
```
Ce commentaire indique la source map associée à ce fichier.
##### Consultation de la source map:

En suivant le lien fourni par le commentaire, par exemple : "http://challenge01.root-me.org/web-client/ch27/static/js/app.a92c5074dafac0cb6365.js", nous accédons à la source map.
Nous téléchargeons ensuite cette source map.

##### Analyse de la source map:

Avec un éditeur de texte tel que "Visual Studio Code", nous ouvrons le fichier source map téléchargé.
Nous cherchons des informations pertinentes à l'aide de mot-clé "flag".

##### Trouver le flag:

En parcourant le fichier source map,à à l'aide de la recherche  mot-clé "flag" nous trouvons le flag :

```javascript
 Here is your flag : BecauseSourceMapsAreGreatForDebuggingButNotForProduction\n\n
```

#### Solution

Le flag est : ` BecauseSourceMapsAreGreatForDebuggingButNotForProduction`.


#### Explications supplémentaires
Source Maps : Les source maps sont des fichiers qui fournissent une correspondance entre le code source et le code généré (par exemple, le JavaScript minifié). Elles sont utilisées principalement pour le débogage lors du développement, car elles permettent de remonter du code minifié au code source original.

Webpack : Webpack est un outil de build très populaire dans l'écosystème JavaScript. Il est couramment utilisé pour regrouper, transformer et optimiser les ressources web telles que les JavaScript, les styles CSS, les images, etc.