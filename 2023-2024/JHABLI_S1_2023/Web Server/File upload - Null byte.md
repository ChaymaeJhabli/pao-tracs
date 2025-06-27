# Challenges

## Serveur Web

### File upload - Null byte:

## Problème:
Pour résoudre le challenge "HTTP - Directory indexing" on démarre le challenge 

## Résoudre

La page affichée nous permet de télécharger des fichiers. Lorsque nous essayons de télécharger un fichier, voici ce qui apparaît :

``` 
    Photo gallery v 0.04
    | upload | Hackin9 | MISC | Phrack
    Upload your photo

    Aucun fichier choisi


    NB : only GIF, JPEG or PNG are accepted

``` 
Il n'est pas possible de télécharger un code PHP (c'est le cas de notre défi).

Après avoir recherché ce qu'est le 'File upload - Null byte', le système ne peut pas spécifier le type de fichier (dans notre cas, nous sommes limités aux types GIF, JPEG ou PNG).
et donc obtient notre mot pass.
## Conclusion
Le flag est le suivant : "YPNchi2NmTwygr2dgCCF"