## Challenges

### Serveur Web

### Challenge: HTTP - Redirection invalide

#### Problème

Ce défi met en lumière le fait de ne pas faire confiance à votre navigateur.

#### Résolution

En observant la description, il est évident que notre navigateur nous redirige vers une page non désirée. Pour résoudre ce problème, nous devons analyser notre URL.

Après avoir rempli le formulaire de login avec les identifiants (par exemple, "test"), l'URL obtenue est la suivante : "http://challenge01.root-me.org/web-serveur/ch32/login.php". En utilisant la commande suivante dans le terminal : "curl http://challenge01.root-me.org/web-serveur/ch32/login.php" , nous obtenons le code source de la page suivante :

```html
<html>
<body>
    <link rel='stylesheet' property='stylesheet' id='s' type='text/css' href='/template/s.css' media='all' />
    <iframe id='iframe' src='https://www.root-me.org/?page=externe_header'></iframe>

    <form method="post" name="form" action="login.php">
        <p>Login : <input type="text" name="login" ></p>
        <p>Password : <input type="password" name="password" ></p>
        <p><input type="submit" value="Log in" ></p>
    </form>
</body>
</html>

```
Il est clair que le navigateur nous redirige vers une page externe "https://www.root-me.org/?page=externe_header" qui n'est pas souhaitée. Habituellement, les applications et les sites web ont toujours un fichier "index.php" qui sert de page d'accueil. Nous remplaçons donc "login.php" par "index.php" dans l'URL, et nous obtenons le flag.

```html
<html>
<body>
    <link rel='stylesheet' property='stylesheet' id='s' type='text/css' href='/template/s.css' media='all' /><iframe id='iframe' src='https://www.root-me.org/?page=externe_header'>
    </iframe>
    
    <h1>Welcome !</h1>
    <p>Yeah ! The redirection is OK, but without exit() after the header('Location: ...'), PHP just continue the execution and send the page content !...</p>
    <p><a href="http://cwe.mitre.org/data/definitions/698.html">CWE-698: Execution After Redirect (EAR)</a></p>
    <p>The flag is : ExecutionAfterRedirectIsBad
    </p>
</body>
</html>
```

#### Solution

Le flag est : "ExecutionAfterRedirectIsBad".