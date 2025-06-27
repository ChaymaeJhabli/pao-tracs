## Épreuves

### Difficulté: Introduction

### Challenge: Header

#### Problème

Cette épreuve vous propose de vous pencher sur une fonctionnalité essentielle du protocole HTTP.

#### Résolution

Après avoir téléchargé tous les fichiers et exécuté la commande ``docker-compose up``, ouvrez votre navigateur et accédez au lien suivant : http://localhost:8000/. Une page s'affiche.

Dans le header de la page web, on trouve deux icônes : 'Header' et 'Source'. En cliquant sur 'Source', un code source s'affiche.

```javascript
const fs = require('fs');
const express = require('express');
const escape = require('escape-html')
var favicon = require('serve-favicon');
const app = express();

app.use(favicon('favicon.ico'));
app.set('view engine', 'ejs');
app.use(express.static('public'));

app.get('/', async (req, res) => {
    var verif = req.header("X-FCSC-2022");
    if (verif == "Can I get a flag, please?") {
        var flag = fs.readFileSync("flag.txt");
        res.status(200);
        res.render("pages/index", {
            type: "success",
            msg: "Here it is: " + flag,
        });
        return res.end();
    } else {
        res.status(200);
        res.render("pages/index", {
            type: "warning",
            msg: "No flag for you. Want a meme instead?",
        });
        return res.end();
    }
});

app.get('/source', async (req, res) => {
    const source = fs.readFileSync(__filename);
    res.render("pages/source", {
        source: escape(source),
    });
    return res.end();
});

app.listen(8000);

```
Le code source fourni nous apprend que lorsque l’on visite la page d’accueil GET /, le serveur vérifie s'il existe dans la requête envoyée le Header X-FCSC-2022 avec sa valeur "Can I get a flag, please?". Si c’est le cas, il ouvre le fichier flag.txt et nous renvoie le flag.

```javascript
var verif = req.header("X-FCSC-2022");
    if (verif == "Can I get a flag, please?") {
        var flag = fs.readFileSync("flag.txt");
        res.status(200);
        res.render("pages/index", {
            type: "success",
            msg: "Here it is: " + flag,
        });
        return res.end();
    }
```
Pour ce faire, ouvrez Insomnia (ou Postman) et accédez au lien http://localhost:8000/ avec la méthode "GET". Dans les headers, ajoutez "X-FCSC-2022" avec la valeur "Can I get a flag, please?", puis envoyez la requête. Vous obtiendrez le flag.
<img src="https://gitlab.insa-rouen.fr/bgauzere/pao-tracs/-/raw/JHABLI_PLANCHOT_WOJCIECHOWSKI/suivi/2023-2024/JHABLI_S2_2024/Hackropole/Header.png" title="Header image">

#### Solution
Le flag est: FCSC{9ec57a4a72617c4812002726750749dd193d5fbbfeef54a27a9b536f00d89dfb}