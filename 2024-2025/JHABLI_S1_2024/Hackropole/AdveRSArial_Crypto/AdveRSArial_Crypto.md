# **Challenge : AdveRSArial Crypto **

## **Contexte :**
Dans ce challenge, un programme chiffre un message en utilisant RSA. Le problème repose sur une particularité : le modulus \( n \), utilisé dans RSA, est un **nombre premier**. Cette condition simplifie le déchiffrement du message, car elle rend l'algorithme RSA vulnérable(c'est à partir de code fournie on remarque que n est premier).

Le code initial génère les éléments suivants :
- \( n \) : un nombre premier (normalement, dans RSA, \( n \) est un produit de deux nombres premiers \( p \times q \)).
- \( e \) : l'exposant public utilisé pour le chiffrement (ici \( e = 65537 \)).
- \( c \) : le texte chiffré.

L'objectif est de retrouver le message original (**flag**) en déchiffrant \( c \).

## **Code fourni :**

```python
from Crypto.Util.number import getStrongPrime, bytes_to_long, long_to_bytes

n = getStrongPrime(2048)
e = 2 ** 16 + 1

flag = bytes_to_long(open("flag.txt", "rb").read())
c = pow(flag, e, n)

print(f"{n = }")
print(f"{e = }")
print(f"{c = }")

```
## Sortie du code :
Les valeurs suivantes sont générées :

- **n** : un grand nombre premier.
- **e = 65537** : un exposant public classique dans RSA.
- **c** : le texte chiffré (résultat du chiffrement du message `flag`).

## Analyse :
À partir du code fourni, on remarque que **n** est un nombre premier. Cela simplifie le déchiffrement de **c**, car normalement **n** est un produit de deux nombres premiers **p × q** dans RSA, ce qui rend la factorisation difficile.

Cependant, ici, comme **n** est premier :

- La fonction d'Euler \( \phi(n) \) devient simplement \( \phi(n) = n - 1 \).
- Le calcul de l'exposant de déchiffrement **d**, qui est l'inverse modulaire de **e** modulo \( \phi(n) \), devient beaucoup plus simple.

## Étapes de la résolution :

1. **Calcul de \( \phi(n) \)** : Comme **n** est premier, \( \phi(n) = n - 1 \).

2. **Calcul de \( d \)** : Le déchiffrement RSA nécessite de trouver l'exposant privé **d**, tel que :

   \[
   d \times e \equiv 1 \mod \phi(n)
   \]

   Cela signifie que **d** est l'inverse modulaire de **e** par rapport à \( \phi(n) \).

3. **Déchiffrement du message** : Une fois **d** calculé, on peut déchiffrer le texte chiffré **c** en calculant :

   \[
   flag = c^d \mod n
   \]

   C'est ce que fait la fonction `pow(c, d, n)`.

4. **Conversion en bytes** : Après avoir trouvé la valeur de **flag**, qui est un entier, il faut la convertir en bytes pour obtenir le texte original.

## Code de déchiffrement :

Le code utilisé pour déchiffrer le message se trouve dans le fichier [RSA.ipynb](./RSA.ipynb).

## Explication des étapes dans le code :

1. **Calcul de \( \phi(n) \)** : Comme **n** est premier, \( \phi(n) \) est simplement \( n - 1 \).

2. **Inverse modulaire de \( e \)** : La fonction `inverse(e, phi_n)` calcule \( d \), l'inverse modulaire de \( e \) modulo \( \phi(n) \).

3. **Déchiffrement avec exponentiation modulaire** : La fonction `pow(c, d, n)` effectue \( c^d \mod n \), ce qui permet de retrouver le message original.

4. **Conversion en bytes** : Le message **flag** est obtenu sous forme d'entier. Pour le lire, il faut le convertir en bytes avec `long_to_bytes(flag)`.

## Solution :
Le flag est : `FCSC{d0bf88291bcd488f28a809c9ae79d53da9caefc85b3790f57615e61c70a45f3c}`

## Conclusion :
À partir du fait que **n** est premier, nous avons pu simplifier le processus de déchiffrement et retrouver facilement le message original. Cela montre que certaines particularités dans les paramètres de RSA peuvent compromettre la sécurité du chiffrement, rendant le message vulnérable à une attaque simple.

