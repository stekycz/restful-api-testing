## Software testing in general

I think it is good to remember basics of software testing before focusing on testing of _RESTful API_. It is a part of software development process which is really important. However it is relatively often forgotten or it stays aside. If developing software is tested then it is good to have some overview of possibilities of testing. I will describe these possibilities in this chapter. Following chapters will assume knowledge of terms and relations mentioned here.

I will focus on three tests classifications. It is good to know that one specific test or group of tests can be classified in more then one group and some test parameters can be combined almost arbitrarily.

### Testing methods

A software or a piece of code can be tested in many ways. If we programm simple function we can assume that "look and see" method is good enough. It is a _static method_ of software testing which is unfortunately prone to errors. I have tried it many time in my job how simple is to do a mistake on a single line of code. It can happen even the code was reviewed by another developer during _code review_ process. This method of testing is not good enough in my opinion. I consider method of _code review_ as a method to check _coding standards_ instead of functionality validation.

Better way to validate functionality is a _dynamic method_. It means run a code and validate if the output coresponds with expectations. This method is very practical in my opinion because it tests **what code realy do** and does not test **what developer thinks the code do**. So in case of software testing in many different environments developer does not have to think about all possibilities. Tests can be simply run in all environments which are wanted to test code in. However we still need to decide how the testing code will run and what method of testing will be choosen. Let's take a look at three (the most often in my opinion) methods.

#### Black-Box testing

This method is the simpliest in my opinion because there is no need to change tests if internal implementation of tested code has been changed. The tested code can be considered as _black box_ which returns some output for given parameters. The important thing is a code must return the same output for the same combination of parameters everytime. There could exists some exceptions (generator of random numbers for example) but for this type of code a different testing method should be considered.

Great advantage of this method is in my opinion the possibility to assign testing to someone who does not know the implementation. Tests can also be created before implementation. I assume this is a good method for so called _Test Driven Development_ (TDD). However there is also a disadvantage. This method can not garant some coverage of tested code. The can be ommited some special cases of input parameters without known implementation. If completeness of tested code coverage is measured it could be hard to have complete coverage using this method (especially for larger software).

#### White-Box testing

The other way of testing method is _white box_. I would rather call it _transparent box_ but that is a small detail now. There should be know an implementation of tested code very well for this method.
There should be a possibility to design combinations of input parameters that code coverage by tests should be maximal. It should also test many well known cases. This method can have less combinations of parameters then previous method because the code can do same things for many different cases. For example adding 1 to 2 and adding 2 to 3 does the same code but the output is different.

I prefer this method to safe some duplicit testing cases and to increase code coverage. Knowledge of internal implementation can be useful for some types of tests. I will talk about it later near to specific test type. However there is higher risk of need to change test if implementation change. Changing tests is not bad thing if they still tests code correctly.

#### Grey-Box testing

Although we could want to test some software using _white box_ method it can be denied by some restrictions. However we can still have more information then public interface of tested code as it is for _black box_ testing. This method is called _grey box_ however it is still _black box_ in my opinion. The only difference is there exists some code documentation. Knowledge of internal functionality of code brings us advantages of _white box_ testing. It should be possible to desing minimum of tests for relatively good code coverage. However it is built on some information or documentation which can be different from real implementation.

There is known a lot of sorting algorithms and each of them has some specific features. If it is wanted to test method which sorts array of values without knowledge of implementation then it can try to sort some different arrays and validate if output is correct. That is _black box_ method and it is hard to validate edge and special cases which could depend on the implementation.

However if it is known that internal implementation is _Quick Sort_ for example then it should be possible to design better testing cases. That is _grey box_ method of testing.

If there is a source code of internal implementation it is possible to complete tests by cases which would be hard to find without knowledge of the implementation. And that is _white box_ method of testing.

![Testing methods difference](./img/testing-methods-difference.png "Testing methods difference")

Each of these three methods has its own advantages and disadvantages. Each one can be used in any part of testing process. Some parts of this process can use more _white box_ and some _black box_. However, how I already suggested above, it can be started using _black box_ for all code and then tests can be improved if needed. It is good to realize that only one method can be used for one test because they covers disjoint sets of cases. It is possible to design part of test parameters by _black box_ method and some parameters by _white box_ method. However that is not usage of both methods together. We just merged parameters and outputs of both methods.

### Testing levels

Tests can be also categorized by levels. It can be used together with categorization by methods. These levels are binded to testing process which I will describe at the end of this chapter. Each test can be categorized only to one level as same as to one testing method. Although each level coresponds with testing process. Their purpose is not only categorization to the process at the right time but complexity with which it tests a code. This categorization is the most known and used, in my opinion, to figure out on which level a product is tested.

#### Unit testing

The simpliest tests are _unit tests_. The unit usually means one function, method or class. I have met the unit as function or method often. A class was used sometimes to separate some group of tests which have something in common (for example methods of one class).

It requires simulation of many processes usually used around the unit because this level of tests should not test anything else then the unit. The simulation is usually known as _mocking_ and it is used to simulate functionality on which the test could depend on. It can be said that tested code also depends on functions, methods and classes built in used language. That is correct question but it could be hard to simulate the functionality. Some custom proxy can be used for general usage in application so it can be mocked in tests. However I did not met this approach yet. There could be missing tests for a proxy at the end.

I use mocking almost on daily basis for mocking a class or an interface. I use so called _mock object_ instead of real implementation. The _mock object_ can have empty methods or return previously known values. It just do known things instead of something what could depends on another code. This level of tests allows us test code independently on real implementation of an interface. If it is wanted to test a model class which loads data from database it is good idea to create _mock object_ for code which communicates with database. The _mock object_ then returns predefined data instead of connecting to database.

Many current testing tools can create _mock object_ itself or there exists some external library which adds this functionality. It can be hard to create _mock objects_ for badly designed code so it is good to think about testing during design part of development process. It can be some of Inversion of Control (IOC) methods (for example Dependency Injection (DI)). It should allow care about dependencies of objects instead of taking or creating them from global space.

This level of tests usually have many test cases (input parameters) for each test. The reason is we want to disclose errors which can depend on these parameters. It is also good if their runing time is as short as possible. It can be simply intergrated to development enviroment of each developer. If these tests are short and integrated then it is simple to run them and disclose some trivial errors before commit to repository. Usually these tests are _white box_ or _grey box_. However _black box_ method can be used too.

#### Integration testing

If it is wanted to test cooperation and compatibility of some components (functions, methods or classes) then _integration tests_ should be created. These tests are usually more complex and they can run longer then unit tests. Although it is wanted to test group of cooperating components there could be some cases for which it could need _mock objects_. Components itself does not have to depend on each other but they can depend on other components out of the group (connection to database for example).

This level of tests tests cooperation of two or more related parts of the whole system. That is the reason why one component can be tested in many different tests with various other components and with various _mock objects_. This level of tests does not want to test all possible input parameters but it should test all parameters which can affect cooperation of tested components. For example the connection to database can be tested in a model code if the database is really called. So if the data will be really loaded from a storage. It could be OK in _unit tests_ however there can be some problem in integration of components which passed _unit tests_.

I have met many times that _integration tests_ are used only and almost none _unit test_ is used. I see a motivation in trying to simplify testing and reduce amount of tests because many _integration tests_ also tests the same thing as _unit tests_. However at the end there exists many versions of slow _integration tests_ because of many parameters which affects only one tested component. It can be assumed as useful. However if _integration test_ fails on error which can be disclosed by simple _unit test_ then finding of real cause can be much harder.

_Integration tests_ does not have to be run after each commit during longer development of one feature or update. It is important to run these tests always before merging new code to master branch. These tests are also _white box_ or _grey box_ for many cases. _Black box_ tests can be used too but there can be more limitations then in _unit tests_ because there can be hard to create _mock object_ without knowledge of implementation.

#### System testing

The most complex tests are those which tests whole system without dependencies on _mock objects_. The only possible _mock object_ can be an external service which does not support an interface for testing integration with the system. These tests runs the longest time and they are focused on testing functionality of whole system by requirements. There should not be found a trivial error (for example about bad parameter of method).

A part of these tests can be automated but a human tester can be also used. Human tester should be focused on testing by predefined scenarios to test functionality of the system. Designing of these tests can be done by someone who does not know exact code but who knows system requirements very well. _Black box_ testing would be probably used the most here however _grey box_ tests can be used too. However I would not use _white box_ tests at this level because it could bring too much details which should be solved by _unit tests_ and _integration tests_.

These tests usually runs longer so it is good to run them automatically once by a time or before releasing or deployment of new version of the product. New version means here also an unstable version which should be tested publicly (release candidate, alpha and beta version) or by specialized testers. If these tests passes then acceptance tests can be next.

#### Acceptance testing

These tests are very similar to system tests however there is a difference. These tests should be run before release of stable version of the product. These tests can be done by development team and also by customer in some cases. These tests should ommit _grey box_ tests and also _white box_ tests. These tests should test satisfaction of requirements only. There can be used the same amount of tests as for _system tests_. However it is good if these tests could be prepared by someone else then who prepared _system tests_ to have higher diversification of testing cases. Without this difference there is no need to have _acceptance tests_ after _system tests_.

### Testing types

Tha last categorization of tests, which I describe here, is type of test. I see it as a general purpose of the test. In many cases it does not care about how to write a test, which functionality should be tested or how well it tests given code. There exists many of these types so I will describe only these which could be useful for RESTful API testing in my opinion. The purpose of each type will be better undestandable from description and an example. Against to previous methods and levels these types can be combined together if it make sense (regression and destruction for example).

#### Compatibility testing

Testing of system compatibility is actualy an _integration test_ at the level of integration of running environment and the application. This type of tests is mostly important during update of system on which the application runs. In case of desktop programm or libraries the target is to test on which running environments the application works.

_Compatibility test_ can be imagined relatively simple. Let's say there are tests for current version of running environment but there is a plan for update of the environment. There is nothing easier then run written tests in new environment. It can disclose the most trivial errors in compatibility. However compatibility depends many times on other parts of the system which could not be covered by automatical tests. It that case it is needed to design _compatibility tests_ on different level. Simple systematic manual testing can be used for basic tests however it is not a sofisticated way for testing.

#### Smoke and sanity testing

_Sanity tests_ are simple and fast. Their purpose is to test basic correct functionality. It will be _unit tests_ often however it could be simple _system test_. The target is to find out if basic logic works correctly and if it is not broken. These tests does not care about edge cases which could slow down testing itself. An example can be simple addition of two integers. For _sanity tests_ is important to know if the result of addition is expected value. If we want to test thoroughly then there should be some test to check overflow of integer value.

_Smoke tests_ are very similar in some view. They are fast and tests correct functionality. The difference is they does not test large part of application but they are focused on the most important parts. It also tests error or exceptional states. So if we would like to programm own calculator then _smoke test_ tests the computation unit only. _Sanity tests_ should also tests other parts of caluclator for correct functionality (for example visibility of the result on a display) however the computation core would not be tested for an error or an exceptional cases.

Both these tests are complementary in many properties. I would mostly use them as _unit tests_ and partialy on other levels.

#### Regression testing

It is a good practice to write test for every occured error. The test should not pass before fix and should pass after fix. The reason why it is a good practice is that if the same error will occure in the code again then the test will disclose it during testing. This type is called _regression test_. An error can occure only in one place of an application but the cause can be on completely different place of application which seem not to influence erroring code. This type of test is usualy an _integration test_ or sometimes a _system test_.

The target of these tests is not validation of correct code functionality but disclosing of potentional errors in a system. Typical regression test for a calculater would be division by zero. We expect that the division will cause some error because it is not allowed operation. If an error does not occure then the test can not pass. However it could also be a test which tests correct behavior and does not pass for wrong result.

#### Destructive testing

_Destructive tests_ are used for thorough testing of edge cases and conditions. The target of these tests is to cause an error. However test will pass if an error does not occure of course. Typical example of a _destructive test_ can be usage of value of different data type then which is expected, empty value or just value in unknown format. In case of calculater it could test computation with very large and very small numbers. If these tests are designed well then it should be very reliable that the application works correctly if tests passes.

#### Performance testing

Testing of performance is very important for many applications. Performance has large impact to good user experience. Performance mostly depends on performance of machine on which it runs, on infrastructure of whole system. It does not have to depend on the code only. Testing of performance cannot be done by simple time measure but there is need of definition of testing conditions and appropriate performance limits. In case of performance of web application it is needed to specify properties of machine on which the tested application would run. Then the testing criterium is amount of requests served during unit of time (second or minute). It can also be a time which tells us how long it takes to serve specified amount of requests.

The description could look like these tests runs only during _system tests_ or _acceptance tests_. However performance can be also measured during _unit tests_ and _integration tests_. For exmaple the most important part of a calculator is its computation unit. So we could measure performance of the computation unit independently on the rest of the calculator. So if performance test passes for computation unit and fails for whole calculater then there is high probability that a bottle neck would not be in computation unit. A side advantage can be that they can also suggest us something during investigation of some error or insufficiency.

#### Security testing

Testing of security is very important without doubts. Generaly speaking it is not only signing in and out of users. It is also about security of some parts of large system, security of data, availability of these data and also integrity of data. It can be difficult to simulate a lot of these cases. That might be the reason why I did not met other security testing then authentication and authorization. So these tests also are _integration tests_ and mostly _system tests_.

### Testing process

Testing process depends on development process itself. However as same as for development process there exists various processes for testing. It depends on levels and types of tests in general. It is possible to have part of tests automatized and another part tested manually. However it is needed to prepare the testing plan for all cases which should itemize what would be tested in which part of development process. One of testers should be responsible for testing process and also for its designing.

It is good to choose appropriate approach for testing instead of only planning. It is possible to choose classical approach during which there is created a code at frist and then some tests are written. It is simple and tests can be designed using _white box_ method. However there can be forgotten some edge case if the test is written by the same person who wrote the code.

I hear about so called _TDD_ (test driven development) a few last years. It means in short story that there are some tests written at the beginning and then the implementation is done to satisfy written tests. The first step is alway as simple as possible test for some functionality. It should not pass because there is no an implementation. Because the test does not pass it is needed to write a code which satisfy the test. If the test is satisfied then it can be extended by another assertions. The process is driven by these short iterations so each step should be very simple. This approach uses _black box_ method because there is no code for which the test is written.

Independently on how tests works it is important to run them repeatedly to validate cerrectness of the application. Tests can be run on a local machine but in case of more tests or more complicated tests there might be needed more performance or time because tests could steal whole performance of a machine so the work cannot continue. It is good to automatize these tests on some external machine which has enough performance. Running tests on external machines during development process is main topic of this thesis and it is called _continuous integration_ (CI).

![An example of development process](./img/development-process.png "An example of development process")

![Trivial testing process](./img/testing-process-1.png "Trivial testing process")

![Simple testing process](./img/testing-process-2.png "Simple testing process")

#### Continuous integration

How it can be imagined from the name it is still continuous process of the integration. The integration does not have to mean cooperation of all system components here. The target of this process is disclosing of errors during development of an application and not after finished development. Each application (compiled, scripted, desktop or web based) can be built to some state which is simple to install or to deploy on a server. Process of so called building can be complicated and long running and that is the reason why it is good to use _continuous integration_ for it.

The process has some requirements and contains a few steps. The first important requirement is to have one shared repository for code (eg. SVN, GIT). The requirement is binded to steps of the process. The second requirement is so called _build server_ or _integration server_ which is used for building of the application. Another requirement is the ability of the team to keep this process alive, to update needed configurations and to evaluate outputs of (almost) each build.

The first step of the process is obtaining of current version of the application from the repository and loading of its dependencies. Which version of the code will be fetched depends on building period and other parameters which may affect running of a build. I will mention these parameters later.

The second (optional) step is compilation of the application depending on used platform. It can be omitted for case of scripting languages. If this step fails then whole build is stoped and marked as failed.

Next step is testing itself. It is the most important step in my opinion. This step should be required for all applications independently on used platform on type of the application. All automatic tests should be run in this step. If at least one test does not pass then whole build failed.

When all tests passes then it can be automatically deployed to testing server in case of web or server application. Teoretically it is possible to automatically create new version of the product and publish the update. However I think there should always be a manual step which can prevent release of incomplete version.

![Continuous integration process](./img/testing-process-3.png "Continuous integration process")

![Complex continuous integration process](./img/testing-process-4.png "Complex continuous integration process")

This process can be highly specific project by project. The biggest difference can be running of the process. It is good to run the build of large applications (or if the build runs very long) once per day for example. If the build is fast (units of minutes) it can be run for each commit in the repository. If the repository uses branches then it is possible to configure which branches will be tested and which not. However the process must run after merge of a branch to the master branch every time without any side conditions.

The process does not have to be only one for the project. There can be special process for development branches which runs only a part of tests. It can be useful for large projects for which the build runs tens of minutes. The easier process can disclose some errors without need of long running. The whole testing process must still run after merge of development branch to the master branch.

How it can be seen the process can be used and changed specificly for almost every project. It allows to setup partial processes for short builds or periodically long running builds. However the pricip stays the same.

There exists many tools for managing this process and there also exists many software testing tools. However low amount of them is focused on _RESTful API_s. I will focus on some of tools for description of testing _RESTful API_ in the next chapter.

### Differences between RESTful API testing and software testing in general

I have described some methods, levels and types of testing. I also added description of development and testing process. However there is missing one important thing. It is the reason why I wrote so many text. I want to think about binding of _RESTful API_ testing to regular testing process. I want to find out some similarities and some differences. I will decribe it in the same direction as above - methods first, then levels and an the end types of tests.

If I consider _RESTful API_ as just another interface then it should be testable using both methods - _white box_ and _black box_. However what does it mean specificaly for _RESTful API_s? One possibility is that it is usable in the same way. If the implementation is known then tests can be built using _white box_ to test edge cases.

On the other side _RESTful API_ is not as simle as regular interface. The data which are provided by _RESTful API_ are loaded from some storage and transformed on server to the ouput. Is not it familiar? It sounds to me like regular web UI. The only difference here is similicity of communication for the end user and the format of received data. I usually do not test edge cases for regular web because it should be done by other tests which are focused on functionality.

I could think that _RESTful API_ is same as regular web UI. However I do not think so because _RESTful API_ is still specific. What is important in my opinion is level of view for these tests. They should test edge cases specific for HTTP protocol[[14](../README.md/#HTTP)] used by _RESTful API_ because it is a part of it. However it should not test various values which affect behavior on the server and not the protocol itself.

When I mention a level of test then there is a question to which levels can be testing of _RESTful API_ categorized. Could it be tested on _system test_ level? I am sure it should because _system tests_ should test everything if possible. What about _integration tests_ or _unit tests_? Can be _RESTful API_ tested on these levels?

Let's start with _unit test_ because of its similicity. What is the unit of _RESTful API_? There are two possibilities in my opininon. It could be one resource or one method which can be used on one resource. The unit should be the smallest part of tested interface. So it should be a resource with one method which can be used for the resource. However how I alredy wrote a _unit test_ should test the unit only. The unit means here whole application on the server so that logic should me mocked. What stays then? There is only an interface of the API because all other parts are parts of the server logic. That is the reason why there are not _unit tests_ talking about _RESTful API_ in my opinion.

_Integration tests_ are a different story. They should tests if all components works correctly together. It means if loading data from a storage and the output formatter works correctly in _RESTful API_. It could also tests if given parameter has wanted meaning or if it is even processed. These tests are really important in my opinion. They definitely should be in process which tests _RESTful API_.

However what is a difference between _integration test_ and _system test_ for _RESTful API_? I think there does not have to be any. However there should be a difference in complexity of testing as I wrote already in section about _integration tests_ earlier. The difference is that _integration test_ can test if some parameter is used or not. However system test should test if the interface corresponds with documentation and if defined scenarios works correctly.

At the end an _integration test_ for testing usage of some parameter can be created with other tests because there does not have to logic which sends it to the real interface. However there can be some data provider which just provides data to specific resource.

So the difference between regular software testing and _RESTful API_ testing is on _system tests_ level. Other tests can be processed together without any specific tools.

After all we still need some server or endpoint to which testing tool should send testing requests and which should return appropriate responses. This endpoint should be created during testing process and should be prepared to some known state (e.g. prepared database).

It is relatively simple to create one testing endpoint before running tests. However some tests could only read data (it is safe). However some tests could write in database and that could be dangerous. If all _RESTful API_ tests runs in serial then they can clean database before every test. However if speed of running tests is wanted and they run in parallel then each test should have some isolated database for itself. It can be handled by many ways. The simpliest is to create new database for each test. But it is slow and it is not needed for read only tests. It can be updated to create one read only database and each test, which can write some data, will create its own database. It can improve performance of these tests dramatically. The best solution would be if each test would run database transaction for itself and rollback it when finished. This approach has a big disadvantage in my opinion because the database server must support multiple transactions in one transaction which encapsulates it.

The last thing I want to mention is that I focus on testing of _RESTful API_ on server. I do not focus on testing client for _RESTful API_. A client testing is very different thing and it is out of bounds of this thesis.
