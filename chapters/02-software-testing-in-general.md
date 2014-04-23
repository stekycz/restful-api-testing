## Software testing in general

Before focusing on testing of _RESTful API_ I think it is good to remember basics of software testing. It is a part of software development process which is realy important however it is relatively often forgotten or it is od the second way. If developing software is tested then it is good to have some overview of possibilities of testing and these possibilities I will describe in this chapter. Following chapters will assume knowledge of terms and relations from here.

I will focus on three tests classifications. It is good to know that one specific test or group of tests can be classified in more then one group and some test parameters can be combined almost arbitrarily.

### Testing methods

A software or a piece of code can be tested in many ways. If we programm simple function we can assume that "look and see" method is good enough. It is _a static method_ of software testing which is unfortunately prone to errors. I have tried it many time in my job how simple is to do a mistake on a single line of code which was reviewed by another developer during _code review_ process. I think this method of testing is not good enough. I consider method of _code review_ as a method to check _coding standards_ instead of functionality validation.

Better way to validate functionality is _a dynamic method_. It means run a code and validate if the output coresponds with expectations. I think this method is very practical because it tests **what code realy do** and does not test **what developer thinks the code do**. So in case of software testing in many different environments developer does not have to think about all possibilities but simply runs tests in all environments he want to test code in. However we still need to decide how we will run testing code and what method of testing we will choose. Let's take a look at three (the most often in my opinion) methods.

#### Black-Box testing

I think this method is the simpliest because there is no need to change tests if internal implementation of tested code is changed. We consider tested code as _black box_ which returns some output for given parameters. The important thing is a code must return the same output for the same combination of parameters everytime. There could exists some exceptions (generator of random numbers for example) but for this type of code we should consider different testing method.

Great advantage of this method is possibility to assign testing to someone who does not know the implementation in my opinion. Tests can be also created before implementation. I assume this is a good method for so called _Test Driven Development_ (TDD). However there is also a disadvantage. This method can not garant some coverage of tested code because without known implementation we can ommit some special cases of input parameters. If we messure completeness of tested code coverage it could be hard to have complete coverage using this method (especially for larger software).

#### White-Box testing

The other way of testing method is _white box_. I would rather call it _transparent box_ but that is a small detail now. We should know very well an implementation of tested code for this method.
We should be able to design combinations of input parameters that code coverage by tests should be maximal. We should also test many well known cases. This method can have less combinations of parameters then previous method because the code can do same things for many different cases (e.g. adding 1 to 2 and adding 2 to 3 does the same code but the output is different).

I prefer this method to safe some duplicit testing cases and to increase code coverage. Knowledge of internal implementation can be useful for some types of tests. I will talk about it later near to specific test type. However there is higher risk of need to change test if implementation change. CHanging tests is not bad thing if they still tests code correctly.

#### Grey-Box testing

Although we could want to test some software using _white box_ method it can be denied by some restrictions. However we can still have more information then public interface of tested code as it is for _black box_ testing. Rhis method is called _grey box_ however I think it is still _black box_ but with code documentation. Knowledge of internal functionality of code brings us advantages of _white box_ testing so we should be able to desing minimum of tests for relatively good code coverage. However we still stand on some information or documentation which can be different from real implementation.

It is known a lot of sorting algorithms and each of them has some specific features. If we want to test method which sorts array of values without knowledge of implementation we will try to sort some different arrays and validate if output is correct. That is _black box_ method and it is hard to validate edge and special cases which depends on implementation.

However if we would know that internal implementation is _Quick Sort_ for example then we should be able to design testing cases better. That is _grey box_ method of testing.

If we have source code of internal implementation we can complete tests by cases which would be hard to find without knowledge of the implementation. And that is _white box_ method of testing.

![Testing methods difference](./img/testing-methods-difference.png "Testing methods difference")

Each of these three methods has its own advantages and disadvantages and each one can be used in any part of testing process. Some parts of this process can use more _white box_ and some _black box_. However how I already suggested above you can start using _black box_ for all code and then improve your tests. It is good to realize only one method can be used for one test because they covers disjoint sets of cases. It is possible to design part of test parameters by _black box_ method and some parameters by _white box_ method. However that is not usage of both methods together. We just merged parameters and outputs of both methods.

### Testing levels

Tests can be also categorized by levels. It can be used together with categorization by methods. These levels are binded to testing process which I will describe at the end of this chapter. Each test can be categorized only to one level as same as to one testing method. Although each level coresponds with testing process their purpose is not only categorization to the process at the right time but complexity with which it tests a code. This categorization is the most known and used, in my opinion, to figure out on which level testing ptoduct is tested.

#### Unit testing

The simpliest tests are _unit tests_. The unit usually means one function, method or class. I have met the unit as function or method often. A class was used sometimes to separate some group of tests which have something in common (for example methods of one class).

It requres simulation of many processes usually used around the unit because this level of tests should not test anything else then the unit. The simulation is usually known as _mocking_ and it is used to simulate functionality on which the test could depend on. It can be said that tested code depends also on functions, methods and classes built in used language. That is correct question but it could be hard to simulate so functionality. Some custom proxy can be used for general usage in application so it can be mocked in tests. However I did not met this approach yet. There still could be missing tests for a proxy.

I use mocking almost on daily basis for mocking a class or an interface. I use so called _mock object_ instead of real implementation. The _mock object_ can have empty methods or return previously known values. It just do known things instead of something what could depends on another code. This level of tests allows us test code independently on real implementation of an interface. If we want to test our model class which loads data from database it is good idea to create _mock object_ for code which comunicates with database. The _mock object_ then returns predefined data instead of connecting to database.

Many current testing tools can create _mock object_ itself or there exists some external library which adds this functionality. It can be hard to create _mock objects_ for badly designed code so it is good to think about testing during design part of development process. It can be some of Inversion of Control methods which should allow care about dependencies of objects instead of taking or creating them from global space.

This level of tests usually have many test cases (input parameters) for each test. The reason is we want to disclose errors which can depend on these parameters. It is also good if their runing time is as short as possible. It can be simply intergrated to development enviroment of each developer. It they are short and integrated then it is simple to run them and disclose some trivial errors before commit to repository. Usually these tests are _white box_ or _grey box_. However _black box_ method can be used too.

#### Integration testing

When we want to test cooperation and compatibility of some components (functions, methods or classes) we should created _integration tests_. These tests are usually more complex and they can run longer then unit tests. Although we want to test group of cooperating components there could be some cases for which we could need _mock objects_. Components itself does not have to depend on each other but they can depend on other components out of the group (connection to database for example).

This level of tests tests cooperation of two or more related parts of the whole system. That is the reason why one component can be tested in many different tests with various other components and with various _mock objects_. This level of tests does not want to test all possible input parameters but it should test all parameters which can affect cooperation of tested components. For example the connection to database can be tested in our model code if the database is realy called and so if the data are realy loaded from storage. It could be OK in _unit tests_ however there can be some problem in integration of components which passed _unit tests_.

I have met many times that _integration tests_ only are used and almost none _unit test_ is used. I see a motivation in trying to simplify testing and reduce amount of tests because many _integration tests_ also tests the same thing as _unit tests_. However at the end there exists many versions of slow _integration tests_ because of many parameters which affects only one tested component. It can be assumed as useful but if _integration test_ fails on error which can be disclosed by simple unit tests then finding of real cause can be much harder.

_Integration tests_ does not have to be run after each commit during longer development of one feature or update. It is important to run these tests always before merging new code to master branch. These tests are also _white box_ or _grey box_ for many cases. _Black box_ tests can be used too but there can be more limitations then in _unit tests_ because there can be hard to create _mock object_ without knowledge of implementation.

#### System testing

The most complex tests are those which tests whole system without dependencies on _mock objects_. The only possible _mock object_ can be an external service which does not support an interface for testing integration with our system. These tests runs the logesst time and they are focused on testing functionality of whole system by requirements. There should not be found a trivial error (for example about bad parameter of method).

A part of these tests can be automated but a human tester can be also used. Human tester should be focused on testing by predefined scenarios to tests functionality of the system. Designing of these tests can be done by someone who does not know exact code but who knows system requirements very well. _Black box_ testing would be probably used the most here however _grey box_ tests can be used too. However I would not use _white box_ tests at this level because it could bring too much details which used be solved by _unit tests_ and _integration tests_.

These tests usually runs longer so it is good to run them automatically once by a time or before releasing or deployment of new version of product. New version means here also an unstable version which should be tested publicly (release candidate, alpha and beta version) or by specialized testers. If these tests passes then acceptance tests can be next step.

#### Acceptance testing

These tests are very similar to system tests however there is a difference. These tests should be run before release of stable version of product. These tests can be done by development team and also by customer in some cases. These tests should ommit _grey box_ tests and also _white box_ tests. These tests should test satisfaction of requirements only. There can be used the same amount of tests as for _system tests_. However it is good if these tests could be prepared by someone else then who prepared _system tests_ to have higher diversification. Without this difference there is no need to have _acceptance tests_ after _system tests_.

### Testing types

Posledním způsobem dělení testů, kterým se zde zabývám, jsou typy testů. Osobně to vidím spíše jako obecný účel konkrétního testu. V mnoha ohledech se totiž nejedná o to, jak test napsat, jakou funkčnost testuje nebo jak moc důkladě testuje daný kód. Těchto typů existuje celá řada, zde se ale budu věnovat jen těm, které považuji za nejlépe využitelné při testování RESTful API. Účel jednotlivých typů bude nejlépe vidět z jejich popisů a z příkladů. Narozdíl od předchozích skupin, jednotlivé typy lze vzájemně kombinovat, protože jeden test může sloužit více účelům (například regresní a destrukční).

#### Compatibility testing

Testování kompatibility systému je v podstatě integrační test na úrovni integrace běhového prostředí a naší aplikace. Tento typ testů je důležitý především při aktualizaci systému, na kterém naše aplikace běží. V případě dektopových programů nebo knihoven je pak cílem otestovat, na kterých verzích běhového prostředí naše aplikace funguje.

Test kompatibility si lze představit poměrně jednoduše. Máme napsané testy pro současnou verzi běhového prostředí, ale plánujeme aktualizaci tohoto prostředí. Není tedy nic jednoduššího, než spustit námi napsané testy v novém prostředí. Tím však můžeme zjistit nejtriviálnější chyby v kompatibilitě. Mnohdy kompatibilita závisí na dalších částech celého systému, které nejsou pokryty automatickými testy a v takovém případě je potřeba navrhnout testování kompatibility na jiné úrovni. Pro základní otestování tedy může posloužit i systematické a jednoduché "proklikání" aplikace, přestože se nejedná o sofistikovaný způsob testování.

#### Smoke and sanity testing

Sanity testy jsou jednoduché a rychlé testy, které ověří základní správnou funkčnost. Často se bude jednat o _unit tests_, ale mohou to být i jednoduché testy systémové. Cílem je zjistit, zda není rozbitá základní logika a zda funguje správně. Tyto testy neřeší okrajové případy, které by testování zpomalily. Příkladem může být testování prostého sčítání celých čísel. Pro sanity testování je potřeba zjistit, zda výsledek součtu je očekávaná hodnota. Pokud bychom chtěli testovat důkladně, bylo by potřeba navíc testovat minimálně přetečení hodnoty `integer`.

Smoke testy jsou v jistém smyslu velice podobné. Jsou rychlé a testují správnou funkčnost. Rozdíl je ale v tom, že netestují povrchně velkou část aplikace, ale zaměřují se na ty nejpodstatnější části, které otestují i na chybové stavy. Pokud bychom tedy programovali vlastní kalkulačku, smoke testy by testovaly jen a pouze samotné výpočetní jádro. Sanity testy by naopak testovaly i jiné části kalkulačky na správnou funkčnost (např. výpis výsledku na displej), ale výpočetní jádro by netestovali na chybné vstupy.

Oba tyto typy se v mnohém doplňují a z jejich podstaty bych je nejvíce využil právě v _unit tests_, v menší míře pak na dalších úrovních.

#### Regression testing

Obecně by mělo platit, že při opravě chyby napíšeme test, který před opravou neprojde a po opravě ano. Napsáním testu si totiž zajistíme, že se stejná chyba nevyskytne znovu, protože při jejím výskytu test neprojde. Takovému testu se říká regresní. Často se jedná o chybu viditelnou na jednom místě systému, která vznikla zásahem do kódu, který zdánlivě tuto část aplikace neovlivňuje. Nejčastě se tedy tento typ testů objevuje jako integrační test, případně jako test systémový.

Cílem těchto testů není kontrola správnosti kódu, ale odhalování možných chyb systému. Typickým regresním testem pro naši kalkulačku by mohlo být dělení nulou. Protože nulou dělit nelze, očekáváme, že daná část kódu skončí chybou. Pokud by kód nefungoval dle očekávání, chyba nenastane a test nesmí projít. Může se ale jednat i o test kontrolující správné chování, který neprojde při chybném výsledku.

#### Destructive testing

Destructive tests slouží pro důkladné testování okrajových případů a podmínek. Snahou těchto testů je zapříčinit chybu. Samozřejmě ale test projde, když chyba nenastane. Typickým příkladem destručního testu může být zadání hodnoty jiného datového typu, prázdné hodnoty nebo jen hodnoty v neznámém formátu. V případě kalkulačky bychom například testovali počítání s hodně velkými nebo malými čísly. Za předpokladu, že jsou tyto testy navrženy dobře, bychom při jejich úspěšném dokončení měli mít jistotu, že aplikace bude fungovat i pokud nastanou okrajové nebo málo pravděpodobné situace.

#### Performance testing

Testování výkonu je pro většinu aplikací velmi důležité. Výkon má totiž velký dopad na to, jak dobře se naše aplikace bude používat uživateli. Výkon je z velké části závislý nejen na kódu naší aplikace, ale může záviset i na výkonu stroje, na kterém běží nebo na infrastruktuře celého systému. Testování výkonu tedy nelze měřit jednoduše podle času, ale je potřeba si stanovit testovací podmínky a pro ně vhodné výkonostní limity. V případě testování výkonu webové aplikace musíme určit, na jak výkoném stroji poběží testovaná aplikace a testovaným kritériem bude počet obsloužených požadavků za jednotku času. Může se jednat i o čas, za který obslouží předem známý počet požadavků.

Z mého popisu se může zdát, že se tyto testy provádí jen v rámci systémových nebo akceptačních testů. Výkon ale můžeme měřit i v rámci _unit tests_ nebo _integration tests_. Například v kalkulačce je pro nás nejdůležité částí komponenta výpočetního jádra a tedy můžeme testovat samostatně výkon tohoto jádra nezávisle na zbytku aplikace. Pokud tedy budou splněny testy pro výpočetní jádro, ale testy celé aplikace selžou, je zde velká pravděpodobnost, že chyba omezující výkon nebude ve výpočetním jádru. Mohou nám tedy nejen ostetovat výkon, ale i napovědět při případném odhalování chyb či nedostatků.

#### Security testing

Testování bezpečnosti je bezesporu důležité. V obecném pojetí se ale nejedná jen o přihlašování a odhlašování uživatelů, ale také o zabezpečení přístupu do částí systému nebo k datům, dostupnost těchto dat a v nespolední řadě jejich integrita. Značnou část kritických případů může být obtížné simulovat a možná proto jsem se doposud setkal s testování především autentifikace a autorizace. V tomto ohledu se tedy jedná o testy integrační a především systémové.

### Testing process

Testovací proces závisí na samotném vývojovém procesu. Stejně jako pro vývoj ale existuje více procesů pro testování. V obecném pojetí testů závisí na jejich úrovních a typech. Část testů může být prováděna automaticky, část jich bude prováděna manuálně testerem. V každém případě je potřeba si připravit plán testování a tím si rozvrhnout, co a jak bude testováno v jaké fázi vývoje. Za samotný proces testování včetně návrhu by měl být zodpovědný jeden z testerů.

Kromě samotného plánu je také dobré zvolit vhodný přístup k testování. Můžeme zvolit klasický přístup, při kterém nejprve programujeme a teprve poté píšeme testy. Takový přístup je poměrně jednoduchý a testy můžeme navrhnout jako _white box_. Můžeme ale opomenout některé okrajové podmínky, především pokud testy nepíše tester ale vývojář.

V posledních letech slyším často o tzv. TDD (test driven development). Ve stručnosti nám tato technika říká, že nejprve napíšeme testy podle našich požadavků a pak teprve doplníme implementaci. Jedná se o jednu z agilních technik. Vždy nejprve napíšeme jednoduchý test a teprve poté píšeme co nejméně implementace pro jeho splnění. Postupujeme tedy v malých iteracích. Tento přístup je ale ze svojí podstaty _black box_.

Ať už ale testy fungují jakýmkoli způsobem, je důležité je také pouštět a ověřovat správnost napsané aplikace. Testy můžeme pouštět vždy ručně na lokálním stroji, ale v případě složitějších testů nám může chybět výkon nebo není možnost pokračovat v práci. Pro tyto účely je tedy vhodné spouštění testů automatizovat na nějakém externím stroji. V této práci se zabývám právě touto částí testovacího procesu zvanou _Continuous integration_.

```
@todo Create diagram of development process with highligted part of testing process
```

```
@todo Create some diagrams of different testing processes
```

#### Continuous integration

Jak už název napovídá, jedná se o pokračující, neustálý proces integrace. Integrací v tomto smyslu nemusí být nutně spolupráce všech systémových komponent. Cílem tohoto procesu je odhalování chyb už během vývoje aplikace a ne až po jejím dokončení. Každá aplikace, ať už kompilovaná nebo skriptovaná, desktopová nebo webová, každou je možné sestavit do stavu, kdy je možné ji jednoduše nainstalovat či nasadit na server. Protože proces sestavení bývá komplikovaný a pro průběžnou kontrolu tedy časově náročný, je pro tyto účely využit proces Continuous integration.

Tento proces má několik požadavků a skládá se z několika kroků. Největším požadavkem je využití společného repozitáře pro verzování kódu (např. SVN, GIT). Tento požadavek souvisí se samotnými kroky tohoto procesu. Dalším požadavkem je tzv. _build_ nebo _integration_ server, který je určen k sestavování aplikace. Mezi další požadavky patří například schopnost vývojového týmu udržovat tento proces, aktualizovat potřebné konfigurace a vyhodnocovat výstupy jednotlivých sestavení.

Prvním krokem tohoto procesu je získání aktuální verze aplikace z verzovacího systému a načtení jeho závislostí. Jaký kôd se bude získávat záleží na tom, jak často a za jakých podmínek se sestavování spouští. Tyto možnosti rozeberu dále.

Druhým (volitelným) krokem je kompilace aplikace v závislosti na použité platformě. V případě skriptovacích jazyků může být tento krok vynechán. Pokud v tomto kroku nastane chyba, dané sestavení končí chybou.

Následuje krok testování, který je dle mého názoru nejdůležitější. Tento krok by měl být povinný pro všechny aplikace nezávisle na použité platformě a na typu aplikace. V této fázi by měly proběhnout všechny automatické testy, které k aplikaci existují. Pokud jediný test neprojde, sestavení končí chybou.

Pokud projdou všechny testy, může v případě webové (či jiné serverové) aplikace následovat krok automatického nasazení na testovací server. Teoreticky je možné v tuto chvíli vytvořit automaticky novou verzi produktu a uveřejnit aktualizaci. Osobně si ale myslím, že nové verze by měly být vydávány manuálně s kontrolou a ne zcela automaticky.

```
@todo Create diagram of continuous integration process
```

Celý tento proces se může hodně lišit projekt od projektu. Velkým rozdílem pak může být spouštění tohoto procesu. Pro velké aplikace a dlouhé sestavení je vhodné zvolit periodické sestavení například přes noc. Pokud je sestavení rychlé (řádově jednotky minut), je možné spustit sestavení pro každý nový commit ve verzovacím systému. V případě používání větví je možné rohodovat, které větve budou testované a které ne. V každém případě musí být proces spuštěn při mergnutí změn do hlavní větvě vývoje.

Tento proces ovšem nemusí být jen jeden pro daný projekt. Pro vývojové větve můžeme chtít použít jeho zjednodušenou variantu (např. spuštění jen některých testů). To se může hodit při vývoji velkého projektu, jehož sestavení trvá desítky minut. Spuštění zjednodušeného procesu nad novou větví může pomoci rychle odhalit základní chyby a důkladné testy budou provedeny až ve složitějším procesu.

Jak je vidět, při použití této techniky můžeme nastavit procesy téměř libovolně pro každý projekt. Můžeme si nastavit více dílčích procesů pro průběžné a rychlé buildy, periodicky spouštět dlouhotrvající, ale princip zůstává stejný.

Existuje celá řada nástrojů pro zavedení tohoto procesu a dále existuje mnoho nástrojů pro testování software. Málo těchto nástrojů se ale zaměřuje na testování RESTful APIs. V následující kapitole se proto podíváme na některé nástroje sloužící k testování nebo popisu RESTful APIs.

### Differences between RESTful API testing and software testing in general

- Co zmanená black-box a co white-box testování pro RESTful API?
- Jaký je rozdíl mezi integračním a systémovým testem pro RESTful API?
- Co je jednotka RESTful API pro unit testy?
- Testovací server/endpoint - jak a kdy vytvářet? Jaká jsou úskalí?
- Testujeme server nebo klienta?
