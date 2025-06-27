## Épreuves

### Difficulté: Introduction

### Challenge: Baby Morse

#### Problème

Cette épreuve vous propose d’obtenir un shell sur la machine pour lire le fichier flag.txt

#### Etape 1: Reconnaissance 

Tout d'abord, nous interagissons avec le serveur pour observer son comportement en utilisant la commande fournie. Alternativement, nous pouvons rendre le fichier exécutable sur notre machine et le tester localement :

```shell
chomd +x bofbof && ./bofbof
```
Cela nous affichera ::

```shell
Comment est votre blanquette ?
>>>
```
Si vous êtes sur le serveur, toute tentative avec une chaîne aléatoire fermera instantanément la connexion.

Notre premier réflexe est de tenter un buffer overflow. Si vous testez localement, vous recevrez ce message :

```shell
Comment est votre blanquette ?
>>> Almost there!
[1]    27372 segmentation fault (core dumped)  ./bofbof  < /usr/bin/echo
```
Une erreur de segmentation indique un débordement de tampon potentiel avec exécution de code. Nous avons même un indice que nous sommes sur la bonne voie. Pour confirmer, nous allons investiguer davantage.

#### Etape 2: Radare time

Analysons le binaire fourni avec radare2.

```shell
r2 -AA ./bofbof
```
Nous utilisons la commande afl pour afficher les fonctions. La fonction main est présente, mais nous pouvons aussi remarquer une intrigante fonction sym.vuln.

En exécutant la commande :

```shell
pdf @ main
```
Nous obtenons les résultats suivants :

<img src="https://gitlab.insa-rouen.fr/bgauzere/pao-tracs/-/raw/JHABLI_PLANCHOT_WOJCIECHOWSKI/suivi/2023-2024/JHABLI_S2_2024/Hackropole/Shell.png" title="Shell image">

Voici les points mis en évidence :

| point | explication                                                                                         |
|-------|-----------------------------------------------------------------------------------------------------|
| 1     | vérifie si la chaîne dans RAX est égale à 0x4141414141414141 (soit AAAAAAAA)                          |
| 2     | vérifie si la chaîne dans RAX est égale à 0x1122334455667788                                           |
| 3     | si RAX n’est pas égale à la chaîne présentée en 2 alors on saute (jump)                               |
| 4     | on exécute la partie sym.vuln, intéressant, nous l’étudierons                                          |
| 5     | notre message d’erreur, et comme nous pouvons le constater, si nous sommes égaux à AAAAAAAA on ne l’aura pas. |

Si nous examinons sym.vuln, nous trouvons le code suivant :

<img src="https://gitlab.insa-rouen.fr/bgauzere/pao-tracs/-/raw/JHABLI_PLANCHOT_WOJCIECHOWSKI/suivi/2023-2024/JHABLI_S2_2024/Hackropole/sys_img.png" title="Systeme image">

MAZELTOV, c’est par ici que nous accèderons au shell.

#### Etape 3: Exploitation

Nous avons identifié la nécessité d'injecter une chaîne dans le programme bofbof, qui, à un moment précis, doit correspondre à la valeur `0x1122334455667788`.

Pour y parvenir, une information essentielle est requise : la taille du tampon.

Cette information est fournie au début de la fonction `main` :

```C
132: int main (int argc, char **argv, char **envp);

│ ; var char *s @ rbp-0x30

│ ; var uint32_t var_8h @ rbp-0x8

```
Ce schéma révèle deux points importants :

La capacité maximale de la chaîne est de 0x30, tandis que le tampon en 64 bits est de 0x8. Par conséquent, la longueur de notre chaîne doit être de -10 caractères (les 8 de la valeur désirée moins 2 pour les caractères de retour à la ligne, \n).
À présent, il est opportun d'ouvrir VIM et d'entamer la rédaction du script Python nécessaire pour cette exploitation.

#### Etape 4: Script Python
Afin de simplifier le processus et d'éviter les complications liées au big endian et au petit endian, nous avons recours à la bibliothèque `pwntools`

Le code se trouve dans le fichier [`bofbof.py`](bofbof.py).

Nous commençons par tester notre exploit en local sur notre propre machine, ce qui nous donne un accès au shell. Victoire ! Ensuite, nous passons en mode en ligne en ajoutant l'option -o lors de l'exécution.

Nous avons maintenant un shell et le flag !

#### Solution
Le flag est: `FCSC{ec30a448a777b571734d8d9e4036b3a6e87d1005446f80dffb26c3e4f5cd02ba}`.