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

### Tools comparison

#### SOAP UI

http://www.soapui.org/

The official web site for this project can be found on www.soapui.org. Many interesting informations related to API testing is there. My first opinion is that these project is targeting corporate companies. I wanted to try this item in use but their trial version requires registraion which I do not like. My opinions on following lines are based on documentation and video on the internet.

The documentation is exhaustive and contains many screenshots. It looks you are able to configure everything from graphical user interface. It is simple and it is possible to configure many technival parameters. However the UI contains too many buttons and block for me so I am a little bit confused. I think it can be useful for someone who needs GUI to configure tests and who do it every day.

You can define many parameters for each request/response pair. Based on tutorial it is very simple do define headers, body and response status code. It also allows you to define different allowed content types and it can be useful. It is relatively simple to define assertions for content, count or existence of some value in body or header. It also allows more complex assertions using regular expresions or scripting. You can define testing endpoint in project settings and it is used for all tests. However definition of more complicated tasks (eg. preparing of the endpoint or its database) before testing is more complicated. I did not fully undestand the possibility of modularization in SOAP UI however there should a way to configure some parameters using GUI. More complicated tasks must be done using some scripts binded to tests.

Their documentation says it is compatible with jUnit somehow. Based on it I think it should be able to work correctly with many CI solutions. There is also some way to configure running from command line instead of basic button in GUI. It has many parameters and you have to install whole SOAP UI on your CI server which would probably need some GUI too.

How I already wrote it looks as corporate solution for me. It can do many things, it has many configuration options and it has relatively easy GUI for clicking all tests. I assume (by name of the project) it started as testing tool for SOAP APIs which has different philosofy. I think it is a good solution for teams which has SOAP API and REST API too. Howeever I do not want to use it for simple project with REST API only because it is to heavy for simple purpose.

#### REST-assured

https://code.google.com/p/rest-assured

Most of information about this tool can be found in its repository and wiki on Google Code. REST-assured is written in Java and the simpliest usage would be in jUnit. It supports many HTTP specific methods for validation which can be useful. However I see this tool as corporate tool as well. I know Java is faster then script languages but in RESTful API testing the test will waiting for response most of time. I do not know why to use it for simple projects which are not written in Java.

It can ba hard to write some tests if you do not know Java but it is relatively easy to learn. There is not way to describe API in other way then writing tests assertions. It is kind of uncomfortable if you have no possibility to generate API description from tests or you can not use API description for tests simplification. I can not say it is hard to write simple tests for your API but it requres Java and probably some other related libraries. However if you write some test then it looks like you write general english sentence and it is valuable for me.

You can assert all basic parameters for request or response using this tool. It also provides some methods specific for cookies. It also supports multi-value headers and cookies which could be useful for more complicated APIs. I really appreciate it can assert value from response message body if it is JSON. It really helps because you do not need to parse response JSON to some structure by yourself because it does REST-assure for you. If you do not want to assert exact value you can use JSON schema validation. I also appreciate definition of base URI and port of the endpoint. It can be used for dynamic definition of endpoint for each test if you run tests in parallel. However I did not test how it works exactly. However it is still only REST assertion tool so you must use another testing tool for running or you can create a simple program by your own.

It should be compatible with jUnit very well because it is mentioned [in documentation](https://code.google.com/p/rest-assured/wiki/GettingStarted). I do not know about some other testing tool for Java so I assume it is enoght to support jUnit. I also assume it is compatible with CI solutions with which jUnit is compatible by itself.

REST-assured is very good testing tool for RESTful APIs which supports many assertions and prcesses around it. I would use it on project where Java is used only. I think it is not comfortable to write tests in Java using Ruby, Python, Node.js or PHP for writing your application. It also does not support description of API so you have to create combination with another tool or write description of API in different place. 

#### Swagger

https://github.com/wordnik/swagger-spec

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
