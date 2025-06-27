## Épreuves

### Difficulté: Introduction

### Challenge: Comparaison

#### Problème

Ce challenge consiste à implémenter une comparaison entre deux registres de données initialisés avec des valeurs aléatoires, puis à mettre 0 dans le registre de données R0 si c’est égal, sinon 1.

#### Résolution

Il est essentiel de parcourir attentivement la documentation de la machine virtuelle disponible [ici](https://hackropole.fr/fr/doc/vm/). Les instructions clés dont nous aurons besoin sont les suivantes :

- **MOV** pour charger une valeur dans un registre.
- **CMP** pour effectuer une comparaison.
- Une instruction de saut (**JZA/JNZA, JZR/JNZR**) pour les branches, qui elles-mêmes incluront un saut pour atteindre la branche finale du programme.

En suivant scrupuleusement les instructions du défi et en se référant à la documentation de l'assembleur de la machine virtuelle, nous pouvons écrire le programme suivant que nous nommerons [`campare.asm`](https://gitlab.insa-rouen.fr/bgauzere/pao-tracs/-/blob/JHABLI_PLANCHOT_WOJCIECHOWSKI/suivi/2023-2024/JHABLI_S2_2024/Hackropole/campare.asm?ref_type=heads).

Après avoir créé le fichier [`campare.asm`](https://gitlab.insa-rouen.fr/bgauzere/pao-tracs/-/blob/JHABLI_PLANCHOT_WOJCIECHOWSKI/suivi/2023-2024/JHABLI_S2_2024/Hackropole/campare.asm?ref_type=heads) et téléchargé tous les fichiers, puis exécuté la commande `docker-compose up`, nous exécutons la commande suivante :

```shell
PS C:\Users\jhabli\Desktop\ITI4\PAO\Docker\Comparaison> python assembly.py campare.asm
0665880000058A000009800000008800000d800000018800000d1400
```
Nous obtenons ce code hexadécimal :  `0665880000058A000009800000008800000d800000018800000d1400`.

Puis nous exécutons la commande ncat localhost 4000, et nous saisissons le code hexadécimal obtenu. Nous obtenons le message suivant :

```shell
PS C:\Users\jhabli\Desktop\ITI4\PAO\Docker\Comparaison> ncat localhost 4000
Enter your bytecode in hexadecimal:
>>> 0665880000058A000009800000008800000d800000018800000d1400
[+] Congrats! Here is the flag: FCSC{6b7b0a69935108a38e58dfcb4efc857973efdc18b9db81ab9de047d3b9100b98}

```
le flag est obtenu.


#### Solution:
Le flag est:  `FCSC{6b7b0a69935108a38e58dfcb4efc857973efdc18b9db81ab9de047d3b9100b98} `.

