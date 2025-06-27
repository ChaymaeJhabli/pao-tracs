## Épreuves

### Difficulté: Introduction

### Challenge: Fifty Shades of White

#### Problème

Dans ce challenge, vous êtes confronté à un programme mystérieux et à une licence codée, tous deux liés au célèbre Walter White. Votre objectif est de décrypter la licence et de manipuler le programme pour obtenir un niveau de privilège plus élevé.

####

Tout d'abord, vous êtes fourni avec deux fichiers :

```
bin_ex.elf:  ELF 64-bit LSB pie executable, x86-64, version 1 (SYSV), dynamically linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=b2d9be8969f6d06075b62cc8911f74c1eab7dd2d, for GNU/Linux 3.2.0, not stripped
license.txt: ASCII text
```

`fifty-shades-of-white` : un exécutable ELF 64 bits, qui semble être le programme à décrypter.
`license-walter-white-junior.txt` : un fichier texte contenant une licence codée en base64.

Ainsi qu'une instance nc : nc challenges.france-cybersecurity-challenge.fr 2250

En exécutant l’instance netcat , vous vous rendez compte qu'il demande une licence. L'objectif est de fournir une licence valide pour obtenir le flag.

En examinant la licence founie, vous remarquez qu'elle est encodée en base64 et contient des informations sur le nom, le numéro de série et le niveau de privilège. En décryptant la licence, vous obtenez :

```vbnet
----BEGIN WHITE LICENSE----
Name: Walter White Junior
Serial: 1d117c5a-297d-4ce6-9186-d4b84fb7f230
Type: 1
-----END WHITE LICENSE-----

```
Il semble y avoir deux niveaux de privilège, et la licence que vous avez est la moins privilégiée. Pour obtenir le flag, vous devez obtenir un niveau de privilège "admin".

#### Résolution

On ouvre le programme sur Ghidra et on commence à renommer les variables, et à comprendre la structure du programme.

La fonction parse vérifie que le fichier license.txt correspond au bon format et définit (m_license + 2) la valeur du type de la licence.

Une fonction de validation est alors exécutée avec le numéro de série.

La fonction check retourne l’indicateur si (m_license c + 2) == 1337.

Il suffit alors de définir Type = 1337, de l’encoder en Base64 tout en conservant le format précédent.

Après avoir modifié le niveau de privilège dans la licence et l'avoir encodée en base64, vous obtenez la licence suivante: 

```vbnet
----BEGIN WHITE LICENSE----
Name: Walter White Junior
Serial: 1d117c5a-297d-4ce6-9186-d4b84fb7f230
Type: 1337
-----END WHITE LICENSE-----

```
En fournissant cette licence modifiée au programme fifty-shades-of-white, vous recevez le flag.

#### Solution
Le flag est: FCSC{2053bb69dff8cf975c1a3e3b803b05e5cc68933923aabdd6179eace1ece0c41a}
