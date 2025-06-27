## Épreuves

### Difficulté: Introduction

### Challenge: QRCode

#### Problème

Cette épreuve vous propose de déchiffrer l'image QR de l'image `flag.png`.

#### Étape 1: Reconnaissance

Nous commençons par télécharger l'image et l'ouvrir pour voir son contenu. Nous pouvons utiliser un outil en ligne tel que [QR Code Generator](https://www.qr-code-generator.com/) pour scanner le code QR et obtenir le message chiffré.

Lorsque on scanne l'image, on ne reçoit pas de message.

#### Étape 2: Résolution

Pour cela, j'ai commencé par créer 3 codes QR et observer les points communs entre eux qui ne sont pas présents dans mon image.

En comparant l'image que nous avons avec les autres générées, vous remarquez quelque chose d'anormal par rapport aux QR codes conventionnels. Les trois grands carrés blancs dans les coins ne contiennent pas de petits carrés noirs à l'intérieur.

L'idée ici est de tenter d'ajouter un carré noir dans chaque grand carré blanc à l'aide d'un éditeur d'image basique. Pour tester, il suffit d'ajouter un simple "pâté" noir dans chaque grand carré, puis de scanner l'image modifiée.

<img src="https://gitlab.insa-rouen.fr/bgauzere/pao-tracs/-/raw/JHABLI_PLANCHOT_WOJCIECHOWSKI/suivi/2023-2024/JHABLI_S2_2024/Hackropole/flag_QR.png" title="Flag QR code image">

#### Solution

Le flag est: ``FCSC{0eea6160d40720fe795adfad6371d78b074dac9c234bfd94f6a94c0c72702a2f}``