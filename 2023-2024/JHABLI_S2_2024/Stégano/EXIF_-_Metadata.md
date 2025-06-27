## Challenges

### STÉGANOGRAPHIE

### Challenge: EXIF - Metadata

#### Problème

Ce défi met en lumière les données EXIF ainsi que la récupération de localisation.

#### Etape1: Téléchargement de l'image

On inspecte le code source de la page, on clique sur le bouton "Démarrer le Challenge" et on trouve un lien vers une image. On télécharge l'image.

#### Etape2 : Extraction des méta-données
Nous devons utiliser exiftool pour récupérer les métadonnées de notre image. Il existe un outil nommé Exiv2. En précisant -pa, il va afficher toutes les métadonnées.

```shell
C:\Users\jhabli\Downloads>exiv2 -pa ch1.png
Exif.Image.ImageDescription                  Ascii      26  S0rry_N0_Gu3ss1ng_Gh1zm0!
Exif.Image.ResolutionUnit                    Short       1  Pouce
Exif.Image.YCbCrPositioning                  Short       1  Centré
Exif.Image.ExifTag                           Long        1  100
Exif.Photo.ExifVersion                       Undefined   4  2.32
Exif.Photo.ComponentsConfiguration           Undefined   4  YCbCr
Exif.Photo.FlashpixVersion                   Undefined   4  1.00
Exif.Photo.CameraOwnerName                   Ascii       7  ISISTM
Exif.Image.GPSTag                            Long        1  162
Exif.GPSInfo.GPSLatitudeRef                  Ascii       2  Nord
Exif.GPSInfo.GPSLatitude                     Rational    3  43deg 17' 56"
Exif.GPSInfo.GPSLongitudeRef                 Ascii       2  Est
Exif.GPSInfo.GPSLongitude                    Rational    3  5deg 22' 49"
```
On voit donc GPSLatitude & GPS Longitude, il suffit de les passer au format DMS.

On voit donc GPSLatitude & GPS Longitude, il suffit de les passer au format DMS.

On s'intéresse à ces données :

GPSLatitude : 43 deg 17’ 56.27" N
GPSLongitude : 5 deg 22’ 49.38" E
GPSPosition : 43 deg 17’ 56.27" N, 5 deg 22’ 49.38" E
Cela donne : 43°17’56"N 5°22’49"E.

#### Etape 3 : Localisation et secours du pépère

On s'est ensuite tourné vers Google Maps pour y entrer les données GPS extraites. Étant donné que Google Maps ne reconnaît pas les données GPS sous cette forme "43 deg 17’ 56.27" N, 5 deg 22’ 49.38" E", on a dû les mettre au bon format pour être reconnu par l’application : "43°17’56" N, 5°22’49" E". Et voilà !

Les coordonnées pointent vers le 2 Place des Capucines à Marseille.

#### Solution

Le flag est : "Marseille".