## RESTful API description and testing tools

V předchozí kapitole jsem popsal a vysvětlil různé metody, úrovně a typy testů pro testování software. Pro účely běžného testování existuje celá řada nástrojů. Každý funguje trochu jinak a zaměřuje se jen na část možností testování. Kombinací několika takových nástrojů bychom měli být schopni otestovat důkladně celou naši aplikaci.

Jak jsem již zmínil v úvodu, dnes existuje jen několik málo nástrojů zaměřujících se na testování RESTful API. K těmto účelům je možné použít i některé dosavadní nástroje, jedná se ale o ohýbání daného nástroje pro jiný účel. Průběžná údržba takových testů bude pravděpodobně velmi náročná a jejich tvorba může být zbytečně komplikovaná.

V této kapitole se budu věnovat několika nástrojům pro testování nebo popis RESTful API, které jsem našel při hledání na Internetu nebo které mi někdo doporučil. V následující části popíšu parametry, na základě kterých budu jednotlivé nástroje hodnotit a ve výsledku i porovnávat mezi sebou. Dále se teprve budu věnovat popisu jednotlivých nástojům a na konci této kapitoly jednotlivé nástroje porovnám a jejich možnosti začlením do kategorií popsaných v první kapitole.

### Specification of important parameters for comparison

```
@todo
```
- Popis API
	- uživatelská přívětivost
	- technické možnosti
- Možnosti testování
	- jednotlivé požadavky a očekávané odpovědi
	- validace odpovědí
		- response code
		- headers
		- body (JSON-schema, XML, ...)
	- scénáře
	- konfigurace prostředí
		- databáze
		- instance testovacího serveru
- Automatické pouštění testů
	- jednoduchost
	- kvalita výstupů
	- možnosti výstupů
- Rychlost testování

### Tools comparison

#### SOAP UI

http://www.soapui.org/

#### REST assured

https://github.com/jayway/rest-assured

#### Swagger

https://github.com/wordnik/swagger-js

#### Postman

http://www.getpostman.com/

#### frisby.js

http://frisbyjs.com/

#### RAML

http://raml.org/

#### Runscope Radar

https://www.runscope.com/

#### Dredd

https://github.com/apiaryio/dredd

### Evaluation of compared tools

### Differences RESTful API testing against to software testing in general
