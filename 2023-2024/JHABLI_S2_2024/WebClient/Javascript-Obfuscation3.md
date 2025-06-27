## Challenges

### Web Client

### Challenge: Javascript - Obfuscation 3

#### Problème

Ce défi consiste à analyser du code pour trouver le flag. 

#### Résolution: 

Nous démarrons le défi:

Voici comment aborder le défi :

1. Tout d'abord, une fenêtre contextuelle (pop-up) apparaît.
2. Ensuite, on inspecte le code source.
3. Dans les sources, on trouve un fichier `ch13.html` qui contient le code suivant :

```html
<html>
<head>
    <title>Obfuscation JS</title>
    <script type="text/javascript">
    function dechiffre(pass_enc){
        var pass = "70,65,85,88,32,80,65,83,83,87,79,82,68,32,72,65,72,65";
        var tab  = pass_enc.split(',');
        var tab2 = pass.split(',');
        var i, j, k, l = 0, m, n, o, p = "";
        i = 0;
        j = tab.length;
        k = j + (l) + (n = 0);
        n = tab2.length;
        for(i = (o = 0); i < (k = j = n); i++ ){
            o = tab[i - l];
            p += String.fromCharCode((o = tab2[i]));
            if(i == 5)break;
        }
        for(i = (o = 0); i < (k = j = n); i++ ){
            o = tab[i - l];
            if(i > 5 && i < k - 1)
                p += String.fromCharCode((o = tab2[i]));
        }
        p += String.fromCharCode(tab2[17]);
        pass = p;
        return pass;
    }
    String["fromCharCode"](dechiffre("\x35\x35\x2c\x35\x36\x2c\x35\x34\x2c\x37\x39\x2c\x31\x31\x35\x2c\x36\x39\x2c\x31\x31\x34\x2c\x31\x31\x36\x2c\x31\x30\x37\x2c\x34\x39\x2c\x35\x30"));
    
    h = window.prompt('Entrez le mot de passe / Enter password');
    alert( dechiffre(h) );
    
</script>
</head>

</html>

```

En analysant ce code, on observe un appel à la fonction `dechiffre()` avec en paramètre une chaîne en ASCII et le tout est passé en paramètre à la fonction `fromCharCode()` :

```html
    String["fromCharCode"](dechiffre("\x35\x35\x2c\x35\x36\x2c\x35\x34\x2c\x37\x39\x2c\x31\x31\x35\x2c\x36\x39\x2c\x31\x31\x34\x2c\x31\x31\x36\x2c\x31\x30\x37\x2c\x34\x39\x2c\x35\x30"));

```
En console: 

```shell 
>"\x35\x35\x2c\x35\x36\x2c\x35\x34\x2c\x37\x39\x2c\x31\x31\x35\x2c\x36\x39\x2c\x31\x31\x34\x2c\x31\x31\x36\x2c\x31\x30\x37\x2c\x34\x39\x2c\x35\x30"
<. '55,56,54,79,115,69,114,116,107,49,50'
>String.fromCharCode(55,56,54,79,115,69,114,116,107,49,50)
<. '786OsErtk12'
```

Le mot de passe est "786OsErtk12".

#### Solution

Le flag est : `786OsErtk12`.