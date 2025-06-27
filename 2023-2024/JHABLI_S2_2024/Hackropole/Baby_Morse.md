## Épreuves

### Difficulté: Introduction

### Challenge: Baby Morse

#### Problème

Cette épreuve vous propose de trouver le flag en utilisant le code Morse.

#### Résolution

Après avoir téléchargé tous les fichiers et exécuté la commande `docker-compose up`, puis la commande `ncat localhost 4000`, on obtient le message suivant :" --.- ..- . ...- --- ..- .-.. . --.. ...- --- ..- ..."

```shell
PS C:\Users\jhabli\Desktop\ITI4\PAO\Docker\Morse> ncat localhost 4000
--.- ..- . ...- --- ..- .-.. . --.. ...- --- ..- ...
>>>
```
On traduit le message en code Morse en utilisant le site web `https://morsedecoder.com/`, on obtient le message : "QUEVOULEZVOUS"

Dans le même site, on code le message "FLAG" en morse, on obtient le message suivant : ' ..-. .-.. .- --. '

```shell
PS C:\Users\jhabli\Desktop\ITI4\PAO\Docker\Morse> ncat localhost 4000
--.- ..- . ...- --- ..- .-.. . --.. ...- --- ..- ...
>>> ..-. .-.. .- --.
Bien jou├®, le flag est :
FCSC{de8b4af784cd394ecc305979ffa124a112a18046037b42c94e4e85216180847e}
```
#### Solution
Le flag est: FCSC{de8b4af784cd394ecc305979ffa124a112a18046037b42c94e4e85216180847e}