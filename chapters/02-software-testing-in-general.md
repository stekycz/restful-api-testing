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

Tha last categorization of tests, which I describe here, is type of test. I see it as a general purpose of the test. In many cases it does not care about how to write a test, which functionality should be tested or how well it tests given code. There exists many of these types so I will describe only these which could be useful for RESTfup API testing in my opinion. The purpose of each type will be better undestandable from description and an example. Against to previous methods and levels these types can be combined together if it make sense (regression and destruction for example).

#### Compatibility testing

Testing of system compatibility is actualy _integration test_ at the level of integration of running environment and our application. This type of tests is important mostly during update of system on which the application runs. In case of desktop programm or libraries the target is to test on which running environments the application works.

_Compatibility test_ can be imagined relatively simple. Let's say we have tests for current version of running environment but we plan update of the environment. There is nothing easier then run written tests in new environment. It can disclose the most trivial error in compatibility. However compatibility depends many times on other parts of the system which could not be covered by automatical tests. It that case it is needed to design _compatibility tests_ on different level. Simple systematic manual testing can be used for basic tests notwithstanding it is not a sofisticated way for testing.

#### Smoke and sanity testing

_Sanity tests_ are simple and fast. Their purpose is to test basic correct functionality. It will be _unit tests_ often however it could be simple system test. The target is to find out if basic logic works correctly and if it is not broken. These tests does not care about edge cases which could slow down testing itself. An example can be simple addition of two integers. For _sanity tests_ is important to know if the result of addition is expected value. If we want to test thoroughly then there should be some test to check overflow of integer value.

_Smoke tests_ are very similar in some view. They are fast and tests correct functionality. The difference is they does not test large part of application but they are focused on the most important parts. It also tests error or exceptional states. So if we would like to programm own calculator then _smoke tests_ the computation unit only. _Sanity tests_ should also tests other parts of caluclator for correct functionality (for example visibility of the result on a display) however the computation core would not be tested for error and exceptional cases.

Both these tests are complementary in many properties. I would use them as _unit tests_ mostly and partialy on other levels.

#### Regression testing

It is a good practice to write test for every error we fixes which should not pass before fix and passes after fix. The reason why it is a good practice is that if the same error will occure in the code then the test will disclose it during testing. This type is called _regression test_. An error can occure only in one place of an application but the cause can be on completely different place of application which seem not to influence erroring code. This type of test is usualy _integration test_ or sometimes _system test_.

The target of these tests is not validation of correct code functionality but disclosing of potentional errors in a system. Typical regression test for a calculater would be division by zero. We expect that the division will cause some error because it is not allowed operation. If an error does not occure then the test can not pass. However it could also be a test which tests correct behavior and does not pass for wrong result.

#### Destructive testing

_Destructive tests_ are used for thorough testing of edge cases and conditions. The target of these tests is to cause an error. However test will pass if an error does not occure of course. Typical example of _destructive test_ can be usage of value of different data type then which is expected, empty value or jsut value in unknown format. In case of calculater we would test computation with very large and very small numbers. If these tests are designed well then we should be very sure that an application works correctly if tests passes.

#### Performance testing

Testing of performance is very important for many applications. Performance has large impact to good user experience. Performance depends mostly on performance of machine on which it runs, on infrastructure of whole system and not only on the code. Testing of performance cannot be done by simple time messure but there is need of definition of testing conditions and appropriate performance limits. In case of performance of web application we must specify properties of machine on which the tested application would run. Then the testing criterium is amount of requests served during unit of time (second or minute). It can be also a time which tells us how long it takes to serve specified amount of requests.

The description could look like these tests runs only during _system tests_ or _acceptance tests_. However performance can be also messured during _unit tests_ and _integration tests_. For exmaple the most important part of a calculator is its computation unit. So we could messure performance of this unit independently on the rest of calculator. So if performance test passes for computation unit and fails for whole calculater then there is hight probability that a bottle neck would not be in computation unit. A side advantage can be that they can also suggest us something during investigation of some error or insufficiency.

#### Security testing

Testing of security is very important without doubts. Generaly speaking it is not only signing in and out of users. It is also about security of some parts of large system, security of data, availability of these data and also integrity of data. It can be difficult to simulate some a lot of cases. That might be the reason why I did not met other security testing then authentication and authorization. So these tests also are _integration tests_ and mostly _system tests_.

### Testing process

Testing process depends on development process itself. However as same as for development process there exists various processes for testing. It depends on levels and types of tests in general. It is possible to have part of tests automatized and another part tested manually. However it is needed to prepare the testing plan for all cases which should itemize what would be tested in which part of development process. One of testers should be responsible for testing process and also for its designing.

It is good to choose appropriate approach to testing instead of only planning. It is possible to choose classical approach during which there is created a code at frist and then some tests are written. It is simple and tests can be designed using _white box_ method. However there can be forgotten some edge cases if the test is written by same person who wrote the code.

I hear about so called _TDD_ (test driven development) a few last years. It means in short story that there are some tests written at the beginning and then the implementation is done to satisfy written tests. The first step is alway as simple as possible test for some functionality. It should not pass because there is no an implementation. Because the test does not pass it is needed to write code which satisfy the test. If the tests is satisfied then it can be extended by another assertions. The process is driven by these short iterations so each step should be very easy. This approach uses _black box_ method because there is no code for which you write the test.

Independently on how tests works it is important to run them repeatedly to validate cerrectness of the application. Tests can be run on a local machine but in case of more tests or more complicated tests there might be needed more performance or time because tests could steal whole performance of a machine so the work cannot continue. It is good to automatize these tests on some external machine which has enough performance. Running tests on external machines during development process is main topic of this thesis and it is called _continuous integration_.

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
