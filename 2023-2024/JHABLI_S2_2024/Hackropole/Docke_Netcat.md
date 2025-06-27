## Épreuves

### Difficulté: Introduction

### Challenge: Docker et Netcat

#### Problème

Cette épreuve vous propose de vérifier que tout est bien opérationnel sur votre machine. C'est très facile.

#### Résolution

Démarrez Docker, téléchargez tous les fichiers et exécutez la commande `docker-compose up`, puis la commande `ncat localhost 4000`, on obtient le message suivant :

```shell
PS C:\Users\jhabli\Desktop\ITI4\PAO\Docker\Docker et Netcat> docker-compose up -d
[+] Running 1/2
 - Network dockeretnetcat_default             Created                                                              0.5s
 ✔ Container dockeretnetcat-welcome-docker-1  Started                                                              0.5s
PS C:\Users\jhabli\Desktop\ITI4\PAO\Docker\Docker et Netcat> ncat localhost 4000

 #######  #####   #####   #####      #####    ###    #####  #
 #       #     # #     # #     #    #     #  #   #  #     # #    #
 #       #       #       #                # #     #       # #    #
 #####   #        #####  #           #####  #     #  #####  #    #
 #       #             # #          #       #     # #       #######
 #       #     # #     # #     #    #        #   #  #            #
 #        #####   #####   #####     #######   ###   #######      #
Here is your flag: FCSC{cc4672dc4e2bd5eb50bb98ee0e8bb2e992e6003baea4e06deeae7a08c4966d96}
```

#### Solution

Le flag est : FCSC{cc4672dc4e2bd5eb50bb98ee0e8bb2e992e6003baea4e06deeae7a08c4966d96}
