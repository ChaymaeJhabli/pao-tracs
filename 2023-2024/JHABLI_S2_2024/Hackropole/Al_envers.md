## Épreuves

### Difficulté: Introduction

### Challenge: À l'aise

#### Problème

Le challenge consiste à inverser des chaînes de caractères envoyées par un service distant. Le service envoie une chaîne de caractères précédée de >>> , et attend en retour la même chaîne, mais avec les caractères dans l’ordre inverse.

#### Résolution

Il faut commencer par se connecter sur le port TCP 4000 pour observer le comportement du service. À partir d’une invite PowerShell,
```shell
ncat localhost 4000
```
Pour le système d'exploitation Windows, on peut installer l'outil Nmap pour qu'on puisse exécuter la commande ci-dessus.
Pour l'instalaation de Nmap, on peut suivre ce lien:" https://nmap.org/download#windows" et on installe la version stable.

##### Écriture du code Powershell
```shell
$server = "localhost"
$port = 4000

$tcpConnection = New-Object System.Net.Sockets.TcpClient($server, $Port)
$tcpStream = $tcpConnection.GetStream()
$reader = New-Object System.IO.StreamReader($tcpStream)
$writer = New-Object System.IO.StreamWriter($tcpStream)
$writer.AutoFlush = $true

$buffer = new-object System.Byte[] 1024
$encoding = new-object System.Text.AsciiEncoding 

function reverse
{
      Param(
        [string]$str
      )
      $sb = New-Object System.Text.StringBuilder($str.Length)
      write-verbose $sb.Capacity
  
      for ($i = ($str.Length - 1); $i -ge 4; $i--)
      {
        [void]$sb.Append($str.Chars($i))
      }
 
      return $sb.ToString()
}

while ($tcpConnection.Connected)
{
    [string]$chaine = $reader.readline()
    Write-Host $chaine
        
    if ($chaine.StartsWith("FCSC"))
    {
        write-host "FOUND :)"
        write-host $chaine -ForegroundColor Green
        break
    }
        
    if ($chaine.startswith(">"))
    {
        $verlan = reverse($chaine)
        $command = $verlan+"`n"
        write-host $command
        $writer.Write($command)
        $writer.Flush()
    }    
       
}

$reader.Close()
$writer.Close()
$tcpConnection.Close()

```
##### Explication du code

Comme on a la difficulté de l’absence de retour à la ligne dans les chaînes de caractères inversées soumises au service. c’est l’objet de la ligne:
```shell
$command = $verlan+"`n"
```
Pareil, il faut filtrer les lignes renvoyées par le serveur pour n’inverser que les chaînes commençant par >>> .

Enfin, le script s’arrête de lui même dès que la chaîne renvoyée par le serveur débutera par “FCSC”, la solution sera alors affichée en couleur verte.
Ce challenge permet de s’exercer à manipuler les chaînes de caractères et à communiquer à l’aide d’un sockect TCP.

#### Solution

Sur le terminaleon execute cette commande:
```shell
PS C:\Users\jhabli\pao-tracs\suivi\2023-2024\JHABLI_S2_2024> .\Hackropole\enver.ps1
```
et on obtient le flag:
```
>>> ANSSI
ISSNA

Well done, continue!
>>> Agence
ecnegA

Well done, continue!
>>> nationale
elanoitan

Well done, continue!
>>> Oui
iuO

Well done, continue!
>>> Bonjour
ruojnoB

Well done, continue!
>>> France
ecnarF

Well done, continue!
>>> baguette
etteugab

Well done, continue!
>>> cassoulet
teluossac

Well done, continue!
>>> 4nOQVM6K
K6MVQOn4

Well done, continue!
>>> UPNfzRK2
2KRzfNPU

Well done, continue!
>>> VfScZ9Hy
yH9ZcSfV

Well done, continue!
>>> SgRoyjK9
9KjyoRgS

Well done, continue!
>>> dwe9qf5B
B5fq9ewd

Well done, continue!
>>> RR4dnYfG
GfYnd4RR

Well done, continue!
>>> cipN8swv
vws8Npic

Well done, continue!
>>> xJNaPDfe
efDPaNJx

Well done, continue!
>>> dGXivsucokHHsFzDZBg7NzZXnuHEIC6e
e6CIEHunXZzN7gBZDzFsHHkocusviXGd

Well done, continue!
>>> 9fPGpOR38svgjiaILqlc7AiOUwCAo9nq
qn9oACwUOiA7clqLIaijgvs83ROpGPf9

Well done, continue!
>>> Bwphxyx9zJYmD94AFNAFGXo6mfIbKzo0
0ozKbIfm6oXGFANFA49DmYJz9xyxhpwB

Well done, continue!
>>> 6XJnKkj88A1xSHgh8XIrvcEWEGC6KU9G
G9UK6CGEWEcvrIX8hgHSx1A88jkKnJX6

Well done, continue!
>>> dfrwrIwMC52USIGKudoecaF2xgf09O5W
W5O90fgx2FaceoduKGISU25CMwIrwrfd

Well done, continue!
>>> uOVMQPSQNHjJi4yTi02qSiWF2vOeYZkn
nkZYeOv2FWiSq20iTy4iJjHNQSPQMVOu

Well done, continue!
>>> LhZmgjK6QyG9WowKw5lRkDal9rTXOe0a
a0eOXTr9laDkRl5wKwoW9GyQ6KjgmZhL

Well done, continue!
>>> pWaEbOOJjh4I6EbGpre1IRFhoEfuAQji
ijQAufEohFRI1erpGbE6I4hjJOObEaWp

Well done, continue!
Congratulations!! Here is your flag:
FCSC{7b20416c4f019ea4486e1e5c13d2d1667eebac732268b46268a9b64035ab294d}
FOUND :)
FCSC{7b20416c4f019ea4486e1e5c13d2d1667eebac732268b46268a9b64035ab294d}

```
le flag est: "FCSC{7b20416c4f019ea4486e1e5c13d2d1667eebac732268b46268a9b64035ab294d}".