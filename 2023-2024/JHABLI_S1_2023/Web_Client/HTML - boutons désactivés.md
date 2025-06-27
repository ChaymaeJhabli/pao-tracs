# Challenges

## WEB - CLIENT

### HTML - boutons désactivés: 

## Problème:

Pour résoudre ce défi, il est nécessaire d'activer le bouton et la barre de texte.

## Trouver la solution
La première étape consiste à inspecter le code de la page du défi pour repérer à la fois les balises du bouton "Access member" et de la barre de texte. Voici leur code source dans la page HTML initial :

```html
<div>
        <input disabled type="text" name="auth-login" value="" />
        <input disabled type="submit" value="Member access" name="authbutton" />
</div>
```
Ensuite, comme deuxième étape, nous retirons l'attribut "disabled" du code pour les activer, ce qui nous permet d'entrer du texte dans la barre et de cliquer sur les boutons pour obtenir le mot de passe:

```html
<div>
        <input  type="text" name="auth-login" value="" />
        <input  type="submit" value="Member access" name="authbutton" />
</div>
```
## Conclusion

En suivant ces étapes, on saisit un mot quelconque dans la barre de texte, ensuite on clique sur le bouton, et ainsi on obtient le mot secret "HTMLCantStopYou".