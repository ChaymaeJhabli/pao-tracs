# Challenges

## STÉGANOGRAPHIE

### Point à la ligne : 

## Problème:

Pour résoudre le challenge , il est nécessaire de trouver le fichier où l'on va trouver les points mentionnés dans l'énoncé. Une fois qu'on clique sur le bouton "démarrer le challenge", cela ne nous donne rien. En tâtonnant, on peut deviner qu'il y a quelque chose dans ce bouton.

## Étape 1 : Trouver le code source

La première étape consiste à inspecter le code de la page du défi, puis à chercher la balise du bouton "démarrer le challenge". Et voilà, on trouve une balise contenant le lien d'un fichier zip et son code source dans la page HTML :

```html
<a class="button small radius" target="_BLANK" href="http://challenge01.root-me.org/steganographie/ch5/ch5.zip">Démarrer le challenge</a>
```
En cliquant sur le lien dans href, notre fichier est téléchargé

## Étape 2 : Trouver le mot secret

Dans le fichier zip, nous découvrons une image représentant une page de journal.

L'énoncé mentionne : “Rien de trop est un point dont on parle sans cesse et qu’on n’observe point.” De plus, le nom du défi est "Point à la ligne". Nous nous concentrons donc sur les points dans le document et spécifiquement sur les caractères situés au-dessus de chaque point, car il est mentionné qu'un point "observe quelque chose dans il regarde vers le haut".


## Conclusion

En rassemblant les lettres obtenues, nous obtenons le mot secret "chatelet15h".