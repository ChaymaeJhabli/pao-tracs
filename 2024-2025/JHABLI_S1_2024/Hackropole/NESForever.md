# Challenge : NES Forever

Le bon vieux temps ! Pour résoudre ce challenge, vous devrez inspecter un langage qui est à la base d'Internet.

## Objectif

Trouver le flag en interagissant avec un conteneur Docker via le port réseau exposé.

## Étapes à suivre

### 1. Téléchargez le fichier `docker-compose.yml`

Utilisez la commande `curl` pour télécharger le fichier `docker-compose.yml` :

```bash
curl https://hackropole.fr/challenges/fcsc2020-web-nes-forever/docker-compose.public.yml -o docker-compose.yml
```
## 2. Lancez le conteneur Docker

Exécutez la commande suivante dans le même répertoire où vous avez téléchargé le fichier `docker-compose.yml` :

```bash
docker compose up
```
## 3. Accédez à l'épreuve

Accédez au challenge via l'adresse suivante dans votre navigateur :

```
http://localhost:8000/
```

## 4. Inspectez le code source

- Ouvrez la page dans votre navigateur.
- Faites un clic droit et sélectionnez "Inspecter" (ou utilisez `Ctrl + Shift + I` sur la plupart des navigateurs).
- Allez dans l'onglet "Éléments" pour inspecter le code HTML de la page.

Dans la section `<body>`, vous trouverez un commentaire contenant le flag :

```html
<body>
  <nav style="padding: 20px; border-bottom: 3px solid #ccc; margin-bottom: 60px;">
    <div class="container">
      <h2 style="margin-bottom: 0;">
        <i class="snes-jp-logo"></i>
        NES_FOREVER
      </h2>
    </div>
  </nav>
  <!--
  FCSC{a1cec1710b5a2423ae927a12db174337508f07b470fc0a29bfc73461f131e0c2}
  -->
  <div class="container">
    <div class="row">
      <!-- left -->
```

## 5. Le Flag

Le flag est trouvé dans le commentaire HTML de la page :
`FCSC{a1cec1710b5a2423ae927a12db174337508f07b470fc0a29bfc73461f131e0c2}` 