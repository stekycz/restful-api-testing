## RESTful API description and testing tools

I have described and explained various methods, levels and types of tests for software testing. There exists a lot of tools for regular testing. Each tool works a little bit different then others. Each tool is focused on a part of testing possibilities. There should be possible to test whole application using a combination of some of these tools.

How I already mentioned in Introduction chapter there exists small amount of tools focused on _RESTful API_ testing. You can use not specialized tool but it is not comfortable as _RESTful API_ specific tool. Creation and maintenance of these tests would be too hard and too complicated.

I will describe a few testing tools which are focused on _RESTful API_ description or testing. I have included description tools because it can be a good start to write own testing tool. I will define paremeters which I will consider during comparion at first. I will focus on each tool next and I will compare all described tools in a higher view at the end of this chapter. I will also categorize tests written in specific tool to categories defined in the previous chapter.

### Specification of important parameters for comparison

I want to describe all following tools without too much technical details. I will describe parameters needed for continuous integration testing.

I will consider API description possibilities at first. I think there is always needed some way to describe how the API looks like and how it works. Easier solutions is better because I do not want to spend long time by writing tests or description of the API. However I also need many specific technical details to desribe in the API (headers, parameters, many response content types etc.).

Next important parametes are focused on testing possibilities. It means more or less details of differences between two tests or specification of each request response, using models etc. I also need some assertions to validate if a request or a response is correct. There are three parameters which should be assertable using HTTP[[14](../README.md/#HTTP)] as background protocol for _RESTful API_. It is response status code, headers and message body. Headers and message body could also be assertable in a request. However these parameters are focused on simple testing so I would like to write more complicated tests using scenarios. It can be called an _integration test_ or _system test_.

The last parameter for testing possibilities is configuration of testing environment. It means configuration of testing database and testing server (endpoint).

I focus on continous integration testing so I have to consider compatibility with exists CI solutions. I want to consider simplicity and possibilities of the output which could be processed automatically.

I wanted to consider speed of testing using specific testing tool. However they are not comparable because each is written in different programming language and that could affect the result a lot. The only relatively comparable option is running tests in parallel. It means in many processes or threads. The tool which supports this feature should run faster then single thread tool.

### Basic tools description

#### SOAP UI

Many interesting informations related to API testing is in the documentation on the official web site[[7](../README.md/#SOAPUI)]. My first opinion is that the project is targeting corporate companies. I wanted to try this tool in use but their trial version requires registraion. I did not want to register anywhere so my opinions on following lines are based on documentation and videos on the internet.

The documentation is exhaustive and contains many screenshots. It looks you are able to configure everything from graphical user interface. It is simple and it is possible to configure many technical parameters. However the UI contains too many buttons and blocks for me. So I am a little bit confused. I think it can be useful for someone who needs GUI to configure tests and who do it every day.

You can define many parameters for each request/response pair. Based on the tutorial it is very simple do define headers, body and response status code. It also allows you to define different allowed content types and it can be useful. It is relatively simple to define assertions for content, headers and count or existence of some value in the message body. It also allows more complex assertions using regular expresions or scripting. It is possible to define testing endpoint in project settings. The endpoint is used for all tests then. However definition of more complicated tasks (eg. preparing of the endpoint or its database) before testing is more complicated. I did not fully undestand the possibility of modularization in SOAP UI[[7](../README.md/#SOAPUI)]. However there should be a way to configure some parameters using GUI. More complicated tasks must be done using some scripts binded to tests.

Their documentation says it is compatible with jUnit[[35](../README.md/#jUnit)] testing framework somehow. Based on this information it should be able to work correctly with many CI solutions in my opinion. There is also some way to configure running from command line instead of basic button in GUI. It has many parameters and it is needed to install whole SOAP UI[[7](../README.md/#SOAPUI)] on your CI server. It would probably need some GUI too.

How I already wrote it looks as corporate solution for me. It can do many things, it has many configuration options and it has relatively easy GUI for clicking all tests. I assume (by name of the project) it started as testing tool for _SOAP API_s which has different philosofy. It is a good solution for teams which has _SOAP API_ and _RESTful API_ too in my opinion. However I do not want to use it for simple project with _RESTful API_ only because it is to heavy for simple purpose.

#### REST-assured

Most of information about this tool can be found in its repository and wiki on Google Code[[34](../README.md/#GoogleCode)]. REST-assured[[8](../README.md/#rest-assured)] is written in Java and the simpliest usage would be with jUnit[[35](../README.md/#jUnit)]. It supports many HTTP[[14](../README.md/#HTTP)] specific methods for validation which can be useful. However I see this tool as corporate tool as well. I know that Java is faster then scripting languages. However testing of RESTful API tests will wait for response most of time. I do not know why to use it for simple projects which are not written in Java.

It can be hard to write some tests if you do not know Java. However it is relatively easy to learn it. There is not way to describe API in other way then writing tests assertions in Java code. It is kind of uncomfortable if you have no possibility to generate API description from tests or you can not use API description for tests simplification. I can not say it is hard to write simple tests for the API but it requires Java and probably some other related libraries. However if you write some test then it looks like you write general english sentence and it is valuable for me.

You can assert all basic parameters for request or response using this tool. It also provides some methods specific for cookies. It also supports multi-value headers and cookies which could be useful for more complicated APIs. I really appreciate it can assert value from response message body if the body is in JSON format. It really helps because you do not need to parse response JSON to some structure by yourself because it is done by REST-assure[[8](../README.md/#rest-assured)]. It is also possible to validate JSON against to JSON schema[[3](../README.md/#JSONSchema)] instead of assertion of exact value. I also appreciate definition of base URI and port of the endpoint. It can be used for dynamic definition of endpoint for each test. It can be useful for running tests in parallel. However I did not test how it works exactly. At the end it is still REST assertion tool only so it is needed to use another testing tool for running. A simple program can be also created by your own for this purpose.

It should be compatible with jUnit[[35](../README.md/#jUnit)] very well because it is mentioned in the documentation[[8](../README.md/#rest-assured)]. I do not know about some other testing tool for Java so I assume it is good enough to support jUnit. I also assume it is compatible with CI solutions which are supported by jUnit.

REST-assured[[8](../README.md/#rest-assured)] is very good testing tool for _RESTful API_s which supports many assertions and processes around it. I would use it on project in which Java is the only one used language. It is not comfortable to write tests in Java using Ruby, Python, Node.js or PHP for implementation of the application in my opinion. It also does not support description of API so you have to create combination with another tool or write description of API in different place.

#### Postman

Postman[[9](../README.md/#postman)] is a browser extension which allows you to define HTTP[[14](../README.md/#HTTP)] requests and browse its responses. It is basic version of this tool. It is possible to pay for premium usage which allows writing some expectations to response and so creaton of tests.

User interface is very simple and modern. Definition of requests and response is similar to SOAP UI[[7](../README.md/#SOAPUI)] but this tool support RESTful services only. However it is simple to click and add header or parameter to a request. It also supports user friendly definition of authentification so it is not needed to think about hashing algorithms. It requires writing of important parameters then hashing and setup of headers is done by Postman.

Postman[[9](../README.md/#postman)] supports almost all general HTTP[[14](../README.md/#HTTP)] methods and authentications. Definition of URL parameters is also very simple - it is definition of key and its value. Url encoding is done automaticaly. Interesting thing is it supports definition of different environments for sending requests. It is useful for running the same request on testing server and on local machine. Postman also allows grouping of requests to collections. The collection can be run by one click. It is very simple to test new feature in API by your own.

On the other hand writing assertions is a little bit harder. It needs JavaScript to write simple assertions. However it is so simple that it can be done by almost everyone. It also allows to assert response time to be fast enough. It can be uselful for basic performance testing. After all it can run defined collections of tests using defined environments. However I see a problem here.

It still requires click to a button to run tests. Then it is needed to check manually if all tests passes. I have not found any way how to run these tests on some CI server. It is the reason why I do not use it for this purpose. I can recomend it if you want to test simple API without any CI server and if your team contains one or two developers. For projects of so size it is a very good and simple solution.

#### frisby.js

Frisby[[10](../README.md/#frisby)] is project written in JavaScript. It runs using Node.js. It is build on top of Jasmine[[24](../README.md/#Jasmine)] testing framework and I see it as very similar tool to REST-assured[[8](../README.md/#rest-assured)]. It is easier to use it if you already know Jasmine. However usage is very simple.

It does not describe API. It is only a testing tool. However it supports many interresting assertions. It supports exact expectations and you can also define so called "contains" expectatins. For example it allows assertion of only a part of some header. So it is not needed to write any regular expresion because there is prepared an expectation method. It also supports definition of custom assertions using anonymous functions and assertions in Jasmine[[24](../README.md/#Jasmine)]. All assertions can be found in the offical documentation[[10](../README.md/#frisby)]. Definition of expectations is simple and powerful. However definition of request is very poor. It supports just definition of URL with all URL parameters in the string, parameters and sending data. I did not found any way how to specify request headers and so how to define some authetification.

Its integration with some CI server depends on Jasmine[[24](../README.md/#Jasmine)]. However I assume there should not be any problem because it is a popular framework for testing. I think it is a good tool for testing simple API without authentication and special request specific headers.

#### RAML

RAML[[11](../README.md/#RAML)] is an acronym for _RESTful API_ modeling language. So it is only a description tool for our purpose. It is based on relatively popular syntax YAML used often in Ruby projects.

It supports hierarchy of resources by its own structure, definition of parameters and headers. It also supports so called traits. Traits are supposed to use for common parameters on many resources. It can be paging for example. Resource path can be parameterized. It can be useful for generating of request URI. However it supports only 4 basic HTTP[[14](../README.md/#HTTP)] methods - `GET`, `PUT`, `POST` and `DELETE`. They are basics but I do not see any reason not to support methods like `HEAD`, `PATCH` or `OPTIONS`.

Some related project exists to support RAML[[11](../README.md/#RAML)] in some development tools. There exists plugin for Sublime Text editor and also Java and JavaScript parsers. I was interested by plugin for SOAP UI. If I understand it well it just creates some templates. However it is very useful if you want to use SOAP UI[[7](../README.md/#SOAPUI)].

How you can see this modeling language can be used by some development tools and you can create your own tool to support RAML[[11](../README.md/#RAML)]. However if creation of tests for the API is wanted then it should not be needed to write custom support for some modeling language. At the end RAML is too verbose in my opininon.

#### Runscope Radar

Instead of previous tools Runscope Radar[[12](../README.md/#Runscope)] is not local machine tool but it is cloud service. It is very simple tool with similar possibilities to SOAP UI[[7](../README.md/#SOAPUI)] and Postman[[9](../README.md/#postman)]. You just define expected response for specific request.

It supports assertions of headers, response status code and body as JSON, XML or plain text. All these values you can assert by some comparators eg. equality of real and expected value. It also supports assertions if value contains expected part of value.

It is cloud service and it is not for free of course. You can try it for free first 30 days and then you must choose one of pricing plans. The cheapest plan costs $49 per month and there is a restriction to 5 team members and 50000 requests per month.

However it does not support testing of private APIs. It requires public access to tested API what should not be needed for testing. When I want to test my API I usually have some CI server on which I want to run my tests. This server should not be public and so I cannot test it by Runscope Radar.

#### Dredd

The last tool I have choosed is Dredd[[13](../README.md/#Dredd)] by Apiary[[20](../README.md/#Apiary)]. It tests API by given API Blueprint[[2](../README.md/#APIBlueprintSpecification)] file which is a special syntax for description of _RESTful API_. You can describe same amount of parameters like using RAML and it adds more possibilities. There are some differences but it is not important now. Its syntax is based on Markdown so it is easy to read and write by humans.

It supports definition of many resources, actions and requests with responses. It also supports definition of models which can be used in many actions, requests and responses. There is also a simple way to define parameters for every resource, action or request. Each parameter can have its data type, default value, example value, description and flag if it is required or optional. It is simple to write description of API if you are familiar with Markdown syntax.

How I already wrote Dredd[[13](../README.md/#Dredd)] is tool for testing API Blueprint[[2](../README.md/#APIBlueprintSpecification)]. That is the most important thing because it tests the contract only. So it does not support definition of any scenario because it just validates the contract. It sends requests, receives response and validates response. There is not state between two requests. However it supports definition of testing endpoint by CLI option. There is also some way to define hooks before and after each test. However that is new feature which I did not test yet.

This tool is very easy to use if you already have definition of your API written in API Blueprint[[2](../README.md/#APIBlueprintSpecification)]. However it is tested in very simple way. If you have more complicated API using authentication you can meet some problems.

### Tools comparison

Let's summarize discovered information about _RESTful API_ description and testing tools. Some of described tools are focused more on description and others are focused on testing itself. However some of them are partially focused on both and those tools I call prototyping tools.

Pure description tool is RAML[[11](../README.md/#RAML)] and API Blueprint[[2](../README.md/#APIBlueprintSpecification)] mentioned with Dredd[[13](../README.md/#Dredd)]. Both tools want to describe _RESTful API_ as simple as possible and easy to read and use by computer. However RAML is highly technical solution using YAML syntax. API Blueprint uses Markdown syntax which is relatively simple to use by general user. I will focus more on API Blueprint later. However it is my favorite language to describe _RESTful API_.

Next group of tools I would use for _RESTful API_ prototyping. These are Postman[[9](../README.md/#postman)] and SOAP UI[[7](../README.md/#SOAPUI)]. Postman is simple "click and go" solution for simple testing and also for prototyping of requests. SOAP UI is more powerful because it support more protocols and there also exists plugin for RAML[[11](../README.md/#RAML)]. The biggest advantage of Postman is that it is lightweight tool. I use Postman in my job because I do not need so many functions which SOAP UI supports. Simplicity of usage and its UI is realy important for me.

The largest group contains the rest of tools. Those are REST-assured[[8](../README.md/#rest-assured)], frisby.js[[10](../README.md/#frisby)], Runscope Radar[[12](../README.md/#Runscope)] and Dredd[[13](../README.md/#Dredd)]. These tools are purly focused on testing of _RESTful API_. REST-assured and frisby.js are very similar. The first is written in Java and the second in JavaScript. However REST-assured is more powerful because it supports better configuration of requests then frisby.js. Runscope Radar is simple "click and go" tool specialized for testing. However its tests are run on public endpoint what would be unwanted by many companies. The last tool is Dredd focused on testing specified contract (an interface) of _RESTful API_. It does not test any scenario. Scenarios are supported by REST-assured and frisby.js because there is programm code of test under your control of tester or developer.

The following table sumarizes comparison above for all tools. Lower number is better and higher number is worst. 

Tool name | Description | Testing | CI integration | Total
--------- |:-----------:|:-------:|:--------------:|:-----:
**SOAP UI** | 3 | 2 | 3 | **3**
**REST-assured** | 5 | 1 | 2 | **3**
**Postman** | 3 | 2 | 5 | **4**
**frisby.js** | 5 | 4 | 2 | **4**
**RAML** | 1 | 4 | 5 | **4**
**Runscope Radar** | 3 | 3 | 5 | **3**
**Dredd** | 1 | 3 | 2 | **2**
[Summarizing table of tools comparison][table-restful-api-testing-tools-comparison]

At the end I think the most univarsal tool is Dredd[[13](../README.md/#Dredd)] using API Blueprint[[2](../README.md/#APIBlueprintSpecification)] now. The reason why I think so is that these tools are very well combined together. API Blueprint is used for description and can be published on Apiary[[20](../README.md/#Apiary)] website which generates simple documentation. The documentation also supports prototyping and development proxies to keep development of server and client separated. Some other tools are more powerful in some special cases but Dredd and API Blueprint is on a good way to support them too in my opinion. Their strengths are hardly to reach by other tools but technical improvements are easier in my opinion.

Next chapter focuses more on API Blueprint[[2](../README.md/#APIBlueprintSpecification)] syntax and its possibilities and also on Dredd[[13](../README.md/#Dredd)] and its behavior.
