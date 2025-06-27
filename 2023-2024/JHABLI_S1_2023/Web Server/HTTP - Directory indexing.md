# Challenges

## Serveur Web

### HTTP - Directory indexing:

## Problème:
Pour résoudre le challenge "HTTP - Directory indexing" on démarre le challenge 

## Résoudre

En inspectant le code, on remarque cette ligne :
```
    <!-- include("admin/pass.html") -->
```

Le problème en ce challenge est lié à la structure des répertoires. En modifiant le lien du challenge de "http://challenge01.root-me.org/web-serveur/ch4/" en "http://challenge01.root-me.org/web-serveur/ch4/admin/", nous pouvons observer ce que cela donne.

Effectivement, cela nous redirige vers une page qui contient 3 répertoires. Lorsque nous consultons le répertoire "backup", nous trouvons le fichier "admin.txt" qui contient notre mot de passe.
Password / Mot de passe : LINUX

## Conclusion
Le flag est le suivant : "LINUX"