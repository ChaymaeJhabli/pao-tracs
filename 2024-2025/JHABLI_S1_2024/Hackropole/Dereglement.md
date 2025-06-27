# Challenge : Dérèglement

## Consigne
Un problème a été rencontré lors de la rédaction du règlement du FCSC et le fichier au format Microsoft Office est corrompu. Vous devez retrouver son contenu pour obtenir le flag.

## Étapes de Résolution

1. **Télécharger le fichier** :
   - Téléchargez le fichier Microsoft Office corrompu depuis le site "2021-fcsc-reglement_de_participation.docx"

2. **Renommer le fichier** :
   - Le fichier corrompu a été nommé `2021-fcsc-reglement_de_participation.docx`.
   - Étant donné que le fichier est corrompu et que Word ne peut pas l'ouvrir, nous avons changé l'extension de `.docx` à `.zip` afin de pouvoir accéder à son contenu sous forme de fichier compressé. Les fichiers Microsoft Word au format `.docx` sont en réalité des archives compressées contenant plusieurs fichiers en format XML. Cette structure permet de séparer le contenu, la mise en forme et d'autres informations du document.
     ```powershell
     Rename-Item "2021-fcsc-reglement_de_participation.docx" "2021-fcsc-reglement_de_participation.zip"
     ```

3. **Extraire le contenu du fichier ZIP** :
   - En renommant le fichier en `.zip`, nous avons pu l'ouvrir avec un outil de décompression pour explorer les fichiers qu'il contient.

4. **Localiser le fichier `document.xml`** :
   - Dans le dossier extrait, nous avons navigué jusqu'au répertoire `word` où se trouve le fichier `document.xml`. Ce fichier contient le contenu principal du document Word.

5. **Examiner le contenu de `document.xml`** :
   - Nous avons ouvert `document.xml` avec un éditeur de texte pour examiner son contenu.
   - À la fin du fichier, le texte trouvé était : 
     ```
     l’âge maximal de participation a été relevé d’un an. FCSC{9bc5a6d51022ac}
     ```
   - Le texte est formaté en XML, et les données principales sont encapsulées dans des balises `<w:t>` qui contiennent le texte réel du document.

6. **Extraire le Flag** :
   - Le flag trouvé est : **`FCSC{9bc5a6d51022ac}`**.
   - Ce flag représente une solution au challenge et confirme que le contenu a été récupéré avec succès.

## Conclusion
Ce challenge a mis en lumière les étapes de récupération de contenu d'un fichier corrompu en exploitant la structure des fichiers `.docx`. En renommant le fichier en `.zip`, nous avons pu accéder aux fichiers internes et localiser le texte principal dans `document.xml`. Ces compétences peuvent être utiles dans des scénarios où des fichiers sont corrompus et nécessitent une récupération manuelle.

### Réflexion
- La méthode de renommer le fichier pour en extraire le contenu repose sur la connaissance des formats de fichiers. En comprenant que les fichiers `.docx` sont des archives compressées, nous avons pu contourner le problème de corruption. Cette approche est courante dans la récupération de données et démontre l'importance de connaître la structure des fichiers numériques pour résoudre des problèmes techniques.
