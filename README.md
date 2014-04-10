# Testing of RESTful API in context of continuous integration

- [Description](#description)
- [Requirements](#requirements)
- [Author](#author)
- [Abstract](#abstract)
- [Abstrakt](#abstrakt)
- [Table of Content](#table-of-content)
- [Bibliography and References](#bibliography-and-references)

## Description

This is the text of master thesis at [FIT CTU in Prague](http://fit.cvut.cz/) written by [Martin Štekl](#author).

Final text will be completely in English however first notes are made in Czech for faster progress.

Original requirements can be found as a [Gist](https://gist.github.com/stekycz/8482392).

## Requirements

Study the basics of testing, different methods, levels and types of testing, processes related to software testing and describe the strengths and weaknesses of various methods, levels and types of tests. Find and compare different tools that focus on testing RESTful API in the context of continuous integration or the description of the RESTful API. Based on these findings describe the differences and similarities in methods of testing code itself for regular SW and methods for testing RESTful API.

Study the syntax of the [API Blueprint](https://github.com/apiaryio/api-blueprint) language for describing RESTful API and study testing tool [Dredd](https://github.com/apiaryio/Dredd). Compare current testing possibilities using this tool to previously described methods and then propose possible changes and modifications to extend the capabilities of this tool.

Choose some of the proposed modifications and implement them. Propose implemented changes as Pull Requests on server [GitHub](https://github.com/) for merge in main repositories of this tool.

## Author

My name is Martin Štekl. Feel free to contact me on [email](mailto:martin.stekl@gmail.com) or follow me on [Twitter](https://twitter.com/stekycz).

## Abstract

```
@todo This will be written at the end
```

## Abstrakt

```
@todo This will be written at the end
```

## Table of Content

1. [Introduction](chapters/01-introduction.md)
2. [Software testing in general](chapters/02-software-testing-in-general.md)
	1. [Testing methods](chapters/02-software-testing-in-general.md#testing-methods)
		1. [Black-Box testing](chapters/02-software-testing-in-general.md#black-box-testing)
		2. [White-Box testing](chapters/02-software-testing-in-general.md#white-box-testing)
		3. [Grey-Box testing](chapters/02-software-testing-in-general.md#grey-box-testing)
	2. [Testing levels](chapters/02-software-testing-in-general.md#testing-levels)
		1. [Unit testing](chapters/02-software-testing-in-general.md#unit-testing)
		2. [Integration testing](chapters/02-software-testing-in-general.md#integration-testing)
		3. [System testing](chapters/02-software-testing-in-general.md#system-testing)
		4. [Acceptance testing](chapters/02-software-testing-in-general.md#acceptance-testing)
	3. [Testing types](chapters/02-software-testing-in-general.md#testing-types)
		1. [Compatibility testing](chapters/02-software-testing-in-general.md#compatibility-testing)
		2. [Smoke and sanity testing](chapters/02-software-testing-in-general.md#smoke-and-sanity-testing)
		3. [Regression testing](chapters/02-software-testing-in-general.md#regression-testing)
		4. [Acceptance testing](chapters/02-software-testing-in-general.md#acceptance-testing)
		5. [Destructive testing](chapters/02-software-testing-in-general.md#destructive-testing)
		6. [Performance testing](chapters/02-software-testing-in-general.md#performance-testing)
		7. [Accessibility testing](chapters/02-software-testing-in-general.md#accessibility-testing)
		8. [Security testing](chapters/02-software-testing-in-general.md#security-testing)
	4. [Testing process](chapters/02-software-testing-in-general.md#testing-process)
		1. [Continuous integration](chapters/02-software-testing-in-general.md#continuous-integration)
3. [RESTful API description and testing tools](chapters/03-restful-api-description-and-testing-tools.md)
	1. [Specification of important parameters for comparison](chapters/03-restful-api-description-and-testing-tools.md#specification-of-important-parameters-for-comparison)
	2. [Tools comparison](chapters/03-restful-api-description-and-testing-tools.md#tools-comparison)
		1. [SOAP UI](chapters/03-restful-api-description-and-testing-tools.md#soap-ui)
		2. [REST assured](chapters/03-restful-api-description-and-testing-tools.md#rest-assured)
		3. [frisby.js](chapters/03-restful-api-description-and-testing-tools.md#frisbyjs)
		4. [RAML](chapters/03-restful-api-description-and-testing-tools.md#raml)
		5. [Runscope Radar](chapters/03-restful-api-description-and-testing-tools.md#runscope-radar)
		6. [Dredd](chapters/03-restful-api-description-and-testing-tools.md#dredd)
	3. [Evaluation of compared tools](chapters/03-restful-api-description-and-testing-tools.md#evaluation-of-compared-tools)
	4. [Differences RESTful API testing against to software testing in general](chapters/03-restful-api-description-and-testing-tools.md#differences-restful-api-testing-against-to-software-testing-in-general)
4. [Evaluation of API Blueprint and Dredd](chapters/04-evaluation-of-api-blueprint-and-dredd.md)
	1. [API Blueprint sytax basics](chapters/04-evaluation-of-api-blueprint-and-dredd.md#api-blueprint-sytax-basics)
		1. [Resources](chapters/04-evaluation-of-api-blueprint-and-dredd.md#resources)
		2. [Actions](chapters/04-evaluation-of-api-blueprint-and-dredd.md#actions)
		3. [Request and Response](chapters/04-evaluation-of-api-blueprint-and-dredd.md#request-and-response)
		4. [Models](chapters/04-evaluation-of-api-blueprint-and-dredd.md#models)
	2. [Dredd testing process](chapters/04-evaluation-of-api-blueprint-and-dredd.md#dredd-testing-process)
		1. [Configuration](chapters/04-evaluation-of-api-blueprint-and-dredd.md#configuration)
		2. [Test running](chapters/04-evaluation-of-api-blueprint-and-dredd.md#test-running)
		3. [CI server integration](chapters/04-evaluation-of-api-blueprint-and-dredd.md#ci-server-integration)
		4. [JSON schema validation](chapters/04-evaluation-of-api-blueprint-and-dredd.md#json-schema-validation)
5. [Implementation of scenario testing](chapters/05-implementation-of-scenario-testing.md)
6. [Conclusion](chapters/06-conclusion.md)
7. [Bibliography](#bibliography)

## Bibliography and References

- [1]<a name="Fielding2000"></a>: R. Fielding. *Architectural Styles and the Design of Network-based Software Architectures*. 2000. (http://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm)
- [2]<a name="APIBlueprintSpecification"></a>: *API Blueprint Language Specification*. (https://github.com/apiaryio/api-blueprint/blob/master/API%20Blueprint%20Specification.md)
- [3]<a name="JSONSchema"></a>: *JSON Schema*. (http://json-schema.org/)
- [4]<a name="Trello"></a>: *Trello*. (https://trello.com/)
- [5]<a name="GitHub"></a>: *GitHub*. (https://github.com/)
- [6]<a name="Cucumber"></a>: *Cucumber*. (https://github.com/cucumber/cucumber-js)
- [7]<a name="SOAPUI"></a>: *SOAP UI*. (http://www.soapui.org/)
- [8]<a name="rest-assured"></a>: *REST-assured*. (https://code.google.com/p/rest-assured/wiki/GettingStarted)
- [9]<a name="postman"></a>: *Postman*. (http://www.getpostman.com/)
- [10]<a name="frisby"></a>: *frisby.js*. (http://frisbyjs.com/)
- [11]<a name="RAML"></a>: *RAML*. (http://raml.org/)
- [12]<a name="Runscope"></a>: *Runscope Radar*. (https://www.runscope.com/)
- [13]<a name="Dredd"></a>: *Dredd*. (https://github.com/apiaryio/dredd)
- [14]<a name="HTTP"></a>: R. Fielding; J. Gettys; J. Mogul; H. Frystyk; L. Masinter; P. Leach; T. Berners-Lee. *Hypertext Transfer Protocol -- HTTP/1.1*. 1999. (http://www.w3.org/Protocols/rfc2616/rfc2616.html)

```
@todo Find some articles or books about software testing and testing process
```
