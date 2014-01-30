# Testing of RESTful API in context of continuous integration

## Abstract

`@todo`

## Abstrakt

`@todo`

## Table of Content

1. [Introduction](#introduction)
2. [Software testing in general](chapters/02-software-testing-in-general.md)
	1. Testing methods
		1. White-Box testing
		2. Black-Box testing
		3. Grey-Box testing
	2. Testing levels
		1. Unit testing
		2. Integration testing
		3. System testing
		4. Acceptance testing
	3. Testing types
		1. Compatibility testing
		2. Smoke and sanity testing
		3. Regression testing
		4. Acceptance testing
		5. Destructive testing
		6. Performance testing
		7. Accessibility testing
		8. Security testing
	4. Testing process
		1. Continous integration
3. [RESTful API description and testing tools](chapters/03-restful-api-description-and-testing-tools.md)
	1. Specification of important parameters for comparison
	2. Tools comparison
		1. SOAP UI
		2. REST assured
		3. Swagger
		4. frisby.js
		5. RAML
		6. Runscope Radar
		7. Dredd — API Blueprint Testing Tool
	3. Evaluation of compared tools
	4. Differences RESTful API testing against to software testing in general
4. [Evaluation of API Blueprint and Dredd](chapters/04-evaluation-of-api-blueprint-and-dredd.md)
5. [Implementation of improvements to Dredd](chapters/05-implementation-of-improvements-to-dredd.md)
6. [Conclusion](#conclusion)
7. [Bibliography](#bibliography)

## Introduction

V posledních několika letech se hodně rozmáhá technologie zvaná REST. Tato technologie byla popsána Royem Fieldingem už v roce 2000 v jeho disertační práci[[1](#Fielding2000)]. Tato technologie je využívána především v oblasti webu, kde našla široké uplatnění. Samotná technologie se jmenuje REST, ale její konkrétní implementace je označována jako RESTful. Implementace se tedy může lišit (a v praxi se i liší), ale pokud jsou splněny základní principy této technologie, je možné takové API označit jako RESTful.

Jako každé API je i RESTful API jen komunikačním rozhraním nějakého systému nebo modulu. Toto rozhraní pak může využít programátor při integrování vlastního systému a systému, který RESTful API poskytuje. Takováto integrace je známa především v oblasti velkých společností, ve kterých spolu komunije celá řáda specifických systémů. V oblasti webu může být taková integrace ale mnohem mocnější. Vhodnou kombinací více RESTful API je poměrně jednoduché vytvořit novou službu, podobně jako stavíme klasický software pomocí knihoven. RESTful API ale často neposkytuje pouze nějakou funkčnost, ale také data.

Dnes se RESTful API používá téměř v každé webové aplikaci. Typickými zastupiteli jsou sociální sítě, které své API vystavují veřejně a může ho použít v podstatě kdokoli. RESTful API je ze svojí podstaty vždy veřejné, ale existují případy, ve kterých je tato vlastnost nežádoucí. Typicky se jedná o RESTful API interních firemních systémů, jejich funkcionalita a data musí zůstat uvnitř společnosti. Může se jednat o API speciální mobilní aplikace a nikdo jiný API využít nesmí. Jsou k tomu použity bezpečnostní mechanismy, kterými se budu v této práci zabývat jen minimálně.

Ať už se jedná o veřejné nebo privátní RESTful API, vždy je důležité mít k němu aktuální dokumentaci a testy. Pokud je API veřejné, jedná se prakticky o nutnost. Čím více RESTful API na světě existuje, tím více nástrojů pro vývoj, dokumentaci a testování vzniká. Jedná se o způsob programování na jiné úrovni než je pouhý programový kód a dosavadní nástroje pro generování dokumentace nebo testování SW nemusí být dostačující. Bohužel nejvíce nástrojů vzniká právě pro vývoj, ale pro dokumentaci a testování je těchto nástrojů poměrně málo.

Tato práce se však nezabývá dokumentací ani popisem RESTful API, ačkoli i tomu se budu krátce věnovat. Stěžejním tématem této ptáce je testování RESTful API. Dokumentaci a tedy i popis API můžeme vytvořit v podstatě i v obyčejném textovém editoru. Stačí si určit vlastní konvence a pustit se do psaní. Testování ale není vhodné takto zjednodušovat a je vhodné pro tyto účely použít specializované nástroje.

Protože se jedná o velmi rozdílný způsob vývoje aplikací než doposud, očekávám, že se liší i metody testování takových aplikací, respektive samotných RESTful API. V této práci se chci zaměřit na nalezení těchto rozdílů a podobností v oblasti testování klasického software a testování RESTful API, protože zde vidím nezmapovanou oblast, ve které můžeme najít mnoho rozdílů i překvapivých podobností.

Dále chci porovnat různé dnes existující nástroje, které umožňují testovat RESTful API a odhalit tak jejich nedostatky či silné stránky. Na základě tohoto porovnání je pak možné zvolit vhodný testovací nátroj při implementaci vlastního RESTful API. V závěru práce chci pro jeden z porovnávaných nástorjů některé nedostatky odstranit vlastní implementací, abych tak uvedl některé svoje poznatky a závěry do praxe.

## Conclusion

`@todo`

## Bibliography

[1]<a name="Fielding2000"></a>: Roy Fielding. *Architectural Styles and the Design of Network-based Software Architectures*. 2000. (http://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm)
