## Épreuves

### Difficulté: Introduction

### Challenge: Bonus Points

#### Problème

Cette épreuve vous propose d'obtenir un score supérieur à 1000 pour débloquer le flag.

#### Résolution

Après avoir téléchargé tous les fichiers et exécuté la commande `docker-compose up`, puis la commande `ncat localhost 4000`, on obtient :

```shell
PS C:\Users\jhabli\Desktop\ITI4\PAO\Docker\BonusPoints> ncat localhost 4000
Hello, here you can get some bonus points for the competition.
You cannot get more than 100 bonus points.
If you go above 1000 you win.
Your score is currently 12
How many bonus points do you want?
>>>
```
On essaie d'obtenir 1000 points même s'ils sont limités à 100, on obtient le message suivant :

```shell
>>> 1000
Stop cheating!
```
Donc, on ne peut pas obtenir le nombre de points que l'on souhaite ? On essaie de trouver une faille dans le code, en essayant d'entrer un nombre négatif, on obtient le message suivant :

```shell
PS C:\Users\jhabli\Desktop\ITI4\PAO\Docker\BonusPoints> ncat localhost 4000
Hello, here you can get some bonus points for the competition.
You cannot get more than 100 bonus points.
If you go above 1000 you win.
Your score is currently 6
How many bonus points do you want?
>>> -1000
Your new score is 4294966302
Congratulations! Here is your flag:
FCSC{750882cf64feb04b384cfa42bbf2167eab337671e663ab238339c6cee884851d}
```
#### Solution
Le flag est: FCSC{750882cf64feb04b384cfa42bbf2167eab337671e663ab238339c6cee884851d}.