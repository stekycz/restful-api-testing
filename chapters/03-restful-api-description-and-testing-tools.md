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

The official web site for this project can be found on www.soapui.org. Many interesting informations related to API testing is there. My first opinion is that these project is targeting corporate companies. I wanted to try this item in use but their trial version requires registraion which I do not like. My opinions on following lines are based on documentation and video on the internet.

The documentation is exhaustive and contains many screenshots. It looks you are able to configure everything from graphical user interface. It is simple and it is possible to configure many technival parameters. However the UI contains too many buttons and block for me so I am a little bit confused. I think it can be useful for someone who needs GUI to configure tests and who do it every day.

You can define many parameters for each request/response pair. Based on tutorial it is very simple do define headers, body and response status code. It also allows you to define different allowed content types and it can be useful. It is relatively simple to define assertions for content, count or existence of some value in body or header. It also allows more complex assertions using regular expresions or scripting. You can define testing endpoint in project settings and it is used for all tests. However definition of more complicated tasks (eg. preparing of the endpoint or its database) before testing is more complicated. I did not fully undestand the possibility of modularization in SOAP UI however there should a way to configure some parameters using GUI. More complicated tasks must be done using some scripts binded to tests.

Their documentation says it is compatible with jUnit somehow. Based on it I think it should be able to work correctly with many CI solutions. There is also some way to configure running from command line instead of basic button in GUI. It has many parameters and you have to install whole SOAP UI on your CI server which would probably need some GUI too.

How I already wrote it looks as corporate solution for me. It can do many things, it has many configuration options and it has relatively easy GUI for clicking all tests. I assume (by name of the project) it started as testing tool for SOAP APIs which has different philosofy. I think it is a good solution for teams which has SOAP API and REST API too. Howeever I do not want to use it for simple project with REST API only because it is to heavy for simple purpose.

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
