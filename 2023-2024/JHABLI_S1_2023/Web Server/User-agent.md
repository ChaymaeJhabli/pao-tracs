# Challenges

## Serveur Web

### HTTP - User-agent :

## Problème:
Pour résoudre le challenge "HTTP - User-agent", suivez ces étapes :

## Étape 1 : User agent = admin

Lancez le challenge et notez que le user agent doit être "admin".
Utilisez Insomnia (ou Postman). Sélectionnez la méthode GET et collez le lien de la page affichée après le démarrage du challenge.
Dans les en-têtes (headers), ajoutez "User-Agent: admin".

## Étape 2 : envoyer requette

Cliquez sur "Send" pour envoyer la requête.
Vous obtiendrez la  réponse suivante :
```html
    <html><body><link rel='stylesheet' property='stylesheet' id='s' type='text/css' href='/template/s.css' media='all' /><iframe id='iframe' src='https://www.root-me.org/?page=externe_header'></iframe><h3>Welcome master!<br/>Password: rr$Li9%L34qd1AAe27
    </h3></body></html>
```
## Conclusion
Le flag est le suivant : "rr$Li9%L34qd1AAe27"