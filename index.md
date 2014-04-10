# Testing of RESTful API in context of continuous integration

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

## Bibliography

- [1]<a name="Fielding2000"></a>: Roy Fielding. *Architectural Styles and the Design of Network-based Software Architectures*. 2000. (http://www.ics.uci.edu/~fielding/pubs/dissertation/top.htm)
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

```
@todo Find some articles or books about software testing and testing process
```
