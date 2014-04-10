## RESTful API description and testing tools

I have described and explained various methods, levels and types of tests for software testing. There exists a lot of tools for regular testing. Every tool works a little bit different then others and is focused on a part of testing possibilities. We should be able to test whole our application using a combination of some of these tools.

How I already mentioned in Introduction chapter there exists small amount of tools focused on RESTful API testing. You can use not specialized tool but it is not comfortable as specific tool. Creation and maintenance of these tests would be too hard and too complicated.

I will describe a few testing tools which are focused on RESTful API description or testing. I have included description tools because it can be a good start to write own testing tool. I will define paremeters which I will consider during comparion at first. I will focus on each tool next and I will compare all described tool in a higher view at the end of this chapter. I will also categorize tests written in specific tool to categories defined in the previous chapter.

### Specification of important parameters for comparison

I want to describe all following tools without any technical details. I will describe parameters needed for continuous integration testing.

I will consider API description possibilities at first. I think you always need some way to describe how your API looks like and how it works. Easier solutions is better because I do not want to spend long time by writing tests or description of API. However I also need many specific technical details to desribe in API (headers, parameters, many response content types etc.).

Next important parametes are about testing possibilities. It means more or less details of differences between two tests or specification of each request response, using models etc. I also need some assertions to validate if my request or response is correct. There are three parameters which should be assertable using HTTP as background protocol for RESTful API. It is response status code, headers and body. Headers and body could be assertable in request too. However these parameters are focused on simple testing so I would like to write more complicated tests using scenario. We can call it integration or system tests. The last parameter for testing possibilities is configuration of testing environment. It means configuration of testing database and testing server (endpoint).

I focus on continous integration testing so I have to consider compatibility with exists CI solutions. I want to consider simplicity and possibilities of the output which could be processed automatically.

I wanted to consider speed of testing using specific testing tool however they are not comparable because each is written in different programming language and that could affect the result a lot. The only relatively comparable option is running tests in parallel. It means in many processes or threads. The tool which supports this feature should run faster then single thread tool.

### Basic tools description

#### SOAP UI

Many interesting informations related to API testing is documentation on official web site[[7](../index.md/#SOAPUI)]. My first opinion is that these project is targeting corporate companies. I wanted to try this item in use but their trial version requires registraion which I do not like. My opinions on following lines are based on documentation and video on the internet.

The documentation is exhaustive and contains many screenshots. It looks you are able to configure everything from graphical user interface. It is simple and it is possible to configure many technival parameters. However the UI contains too many buttons and block for me so I am a little bit confused. I think it can be useful for someone who needs GUI to configure tests and who do it every day.

You can define many parameters for each request/response pair. Based on tutorial it is very simple do define headers, body and response status code. It also allows you to define different allowed content types and it can be useful. It is relatively simple to define assertions for content, count or existence of some value in body or header. It also allows more complex assertions using regular expresions or scripting. You can define testing endpoint in project settings and it is used for all tests. However definition of more complicated tasks (eg. preparing of the endpoint or its database) before testing is more complicated. I did not fully undestand the possibility of modularization in SOAP UI however there should a way to configure some parameters using GUI. More complicated tasks must be done using some scripts binded to tests.

Their documentation says it is compatible with jUnit somehow. Based on it I think it should be able to work correctly with many CI solutions. There is also some way to configure running from command line instead of basic button in GUI. It has many parameters and you have to install whole SOAP UI on your CI server which would probably need some GUI too.

How I already wrote it looks as corporate solution for me. It can do many things, it has many configuration options and it has relatively easy GUI for clicking all tests. I assume (by name of the project) it started as testing tool for SOAP APIs which has different philosofy. I think it is a good solution for teams which has SOAP API and REST API too. Howeever I do not want to use it for simple project with REST API only because it is to heavy for simple purpose.

#### REST-assured

Most of information about this tool can be found in its repository and wiki on Google Code. REST-assured is written in Java and the simpliest usage would be in jUnit. It supports many HTTP specific methods for validation which can be useful. However I see this tool as corporate tool as well. I know Java is faster then script languages but in RESTful API testing the test will waiting for response most of time. I do not know why to use it for simple projects which are not written in Java.

It can ba hard to write some tests if you do not know Java but it is relatively easy to learn. There is not way to describe API in other way then writing tests assertions. It is kind of uncomfortable if you have no possibility to generate API description from tests or you can not use API description for tests simplification. I can not say it is hard to write simple tests for your API but it requres Java and probably some other related libraries. However if you write some test then it looks like you write general english sentence and it is valuable for me.

You can assert all basic parameters for request or response using this tool. It also provides some methods specific for cookies. It also supports multi-value headers and cookies which could be useful for more complicated APIs. I really appreciate it can assert value from response message body if it is JSON. It really helps because you do not need to parse response JSON to some structure by yourself because it does REST-assure for you. If you do not want to assert exact value you can use JSON schema validation. I also appreciate definition of base URI and port of the endpoint. It can be used for dynamic definition of endpoint for each test if you run tests in parallel. However I did not test how it works exactly. However it is still only REST assertion tool so you must use another testing tool for running or you can create a simple program by your own.

It should be compatible with jUnit very well because it is mentioned in documentation[[8](../index.md/#rest-assured)]. I do not know about some other testing tool for Java so I assume it is enoght to support jUnit. I also assume it is compatible with CI solutions with which jUnit is compatible by itself.

REST-assured is very good testing tool for RESTful APIs which supports many assertions and prcesses around it. I would use it on project where Java is used only. I think it is not comfortable to write tests in Java using Ruby, Python, Node.js or PHP for writing your application. It also does not support description of API so you have to create combination with another tool or write description of API in different place.

#### Postman

Postman is a browser extension which allows you to define HTTP requests and browse its responses. It is basic version of this tool. You can pay for premium usage which allows you to write some expectations to response and so create tests.

User interface is very simple and modern. Definition of requests and response is similar to SOAP UI but this tool support RESTful services only. However it is simple to click and add header or parameter to request. It also support user friendly definition of authentification so you do not have to think about hashing algorithms. You can just write important parameters and hashing and setting of headers will be done by Postman.

Postman supports almost all general HTTP methods and authentications. Definition of URL parameters is also very simple - it is definition of key and its value. Url encoding is done automaticaly. Interesting thing is you can define different environments for sending requests. It is useful when you want to run the same request on your testing server and on your localhost. Postman also allows to group requests to collections which can be run by one click. It is very simple to test new feature in API by your own.

On the other hand writing assertions is a little bit harder. You will need JavaScript to write simple assertions. It is so simple that it can be done by almost everyone. It also allows to assert response time to be fast enough. It can be uselful for basic performance testing. After all you can run your collections of tests using defined environments. However I see a problem here.

You still must click to button to run tests and check by your eyes if every test passes. I have not found any way how to run these tests on some CI server. It is the reason why I do not use it for this purpose. I can recomend it if you want to test simple API without any CI server and if you are one or two developers. For projects of so size it is a very good and simple solution.

#### frisby.js

Frisby is project written in JavaScript to run using Node.js. It is build on top of Jasmine testing framework and I see it as very similar tool as REST-assured. It is easier to use it if you already know Jasmine. If you do not usage is still very simple.

It does not describe API. It is only testing tool. However it supports many interresting assertions. It supports exact expectations and you can also define so called "contains" expectatins. For example if you want to assert only part of some header you do not have to write any regular expresion but there is an expectation method prepared for you. You can also define your own assertions using anonymous functions and assertions in Jasmine. All assertions can be found in offical documentation. Definition of expectations is simple and powerful but definition of request is very poor. You can define only URL with all URL parameters in the string, parameters and sending data. I did not found any way how to specify request headers and so how to define some authetification.

Its integration with some CI server depends on Jasmine. However I assume there should not be any problem because it is a popular framework for testing. I think it is a good tool for testing simple API without authentication and special request specific headers.

#### RAML

RAML is and acronym RESTful API modeling language. SO it is only a description tool for our purpose. It is based on relatively popular syntax YAML used often in Ruby projects.

It supports hierarchy of resources by its own structure, definition of parameters and headers and it also supports so called traits. Traits are supposed to use for common parameters on many resources. It can be paging for example. Resource path can be parameterized what can be useful for generating of request URI. However it supports only 4 basic HTTP methods - GET, PUT, POST and DELETE. They are basics but I do not see any reason not to support methods like HEAD, PATCH or OPTIONS.

Some related project exists to support RAML in development tools. There exists plugin for Sublime Text editor, Java and JavaScript parsers and I was interested by plugin for SOAP UI. If I understand it well it will create some templates only. However it is very useful if you want to use SOAP UI.

How you can see this modeling language can be used by some development tools and you can create your own to support RAML. Howeever wehen I want to create tests for my API I do not want to write my own support for some modeling language which is in my opininon too verbose.

#### Runscope Radar

Instead of previous tools Runscope Radar is not local machine tool but it is cloud service. It is very simple tool with similar possibilities to SOAP UI and Postman. You just define expected response for specific request.

It allows you to assert headers, response status code and body as JSON, XML or plain text. All these values you can assert by some comparators eg. equality of real and expected value or if value contains expected part of value.

It is cloud service and it is not for free of course. You can try it for free first 30 days and then you must choose on of pricing plans. The cheapest plan costs $49 per month and there is a restriction to 5 team members and 50000 requests per month.

However it does not support testing of private APIs. If requires public access to tested API which I do not like. When I want to test my API I usually have some CI server on which I want to run my tests. This server should not be public and so I cannot test it by Runscope Radar.

#### Dredd

https://github.com/apiaryio/dredd

### Tools comparison

### Differences between RESTful API testing and software testing in general
