# Challenges

## Serveur Web

### Install files:

## Problème:
Pour résoudre le challenge "HTTP - Directory indexing" on démarre le challenge 

## Résoudre
Après des recherches sur cette installation défaillante, nous avons découvert qu'elle est l'une des nombreuses failles de phpBB.

Cette faille est en fait due à un oubli du webmaster qui aurait dû supprimer ces dossiers. Ils contiennent les pages d'installation du forum phpBB.

Ainsi, pour y accéder, il suffit de changer le lien du challenge "http://challenge01.root-me.org/web-serveur/ch6" en "http://challenge01.root-me.org/web-serveur/ch6/phpbb/install/install.php".

Voici le résultat :
```
    Bravo, vous venez de decouvrir une des nombreuses failles de phpBB.

    Cette faille est en fait un oubli du Webmaster qui aurait du enlever
    ces dossiers. Ils contiennent les pages d'installations du forum phpbb.
    Ce genre de chose n'existe plus car les développeurs mettent en place des
    systèmes de vérification pour faciliter la tâche aux plus têtes en l'air
    Ce qu'il faut comprendre par contre c'est qu'on découvre souvent beaucoup de choses
    en trifouillant des URL...
    Grâce à elles, vous pouvez remettre à zéro le forum, et changer tous les passwords
    administrateur, étant donné que vous reinitialisez le forum.
    Vous avez donc ensuite un contrôle total du forum !!

    Le mot de passe pour valider est : karambar

    Bon courage !

```

## Conclusion
Le flag est le suivant : "karambar"