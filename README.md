# Testing of RESTful API in context of continuous integration

- [Description](#description)
- [Requirements](#requirements)
- [Abstract](#abstract)
- [Abstrakt](#abstrakt)
- [Table of Content](#table-of-content)
- [Bibliography and References](#bibliography-and-references)

## Description

This is the text of master thesis at [FIT CTU in Prague](http://fit.cvut.cz/) written by [Martin Štekl](#author). Feel free to contact me on [email](mailto:martin.stekl@gmail.com) or follow me on [Twitter](https://twitter.com/stekycz).

Original requirements can be found as a [Gist](https://gist.github.com/stekycz/8482392).

Project related to this text can be found in [separate repository](https://github.com/stekycz/cucumber-4-api-blueprint).

## Requirements

Study the basics of testing, different methods, levels and types of testing, processes related to software testing and describe the strengths and weaknesses of various methods, levels and types of tests. Find and compare different tools that focus on testing RESTful API in the context of continuous integration or the description of the RESTful API. Based on these findings describe the differences and similarities in methods of testing code itself for regular SW and methods for testing RESTful API.

Study the syntax of the [API Blueprint](https://github.com/apiaryio/api-blueprint) language for describing RESTful API and study testing tool [Dredd](https://github.com/apiaryio/Dredd). Compare current testing possibilities using this tool to previously described methods and then propose possible changes and modifications to extend the capabilities of this tool.

Choose some of the proposed modifications and implement them. Propose implemented changes as Pull Requests on server [GitHub](https://github.com/) for merge in main repositories of this tool.

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
	5. [Differences between RESTful API testing and software testing in general](chapters/02-software-testing-in-general.md#differences-between-restful-api-testing-and-software-testing-in-general)
3. [RESTful API description and testing tools](chapters/03-restful-api-description-and-testing-tools.md)
	1. [Specification of important parameters for comparison](chapters/03-restful-api-description-and-testing-tools.md#specification-of-important-parameters-for-comparison)
	2. [Basic tools description](chapters/03-restful-api-description-and-testing-tools.md#basic-tools-description)
		1. [SOAP UI](chapters/03-restful-api-description-and-testing-tools.md#soap-ui)
		2. [REST assured](chapters/03-restful-api-description-and-testing-tools.md#rest-assured)
		3. [frisby.js](chapters/03-restful-api-description-and-testing-tools.md#frisbyjs)
		4. [RAML](chapters/03-restful-api-description-and-testing-tools.md#raml)
		5. [Runscope Radar](chapters/03-restful-api-description-and-testing-tools.md#runscope-radar)
		6. [Dredd](chapters/03-restful-api-description-and-testing-tools.md#dredd)
	3. [Tools comparison](chapters/03-restful-api-description-and-testing-tools.md#tools-comparison)
4. [Details about API Blueprint and Dredd](chapters/04-details-about-api-blueprint-and-dredd.md)
	1. [API Blueprint sytax basics](chapters/04-details-about-api-blueprint-and-dredd.md#api-blueprint-sytax-basics)
		1. [Resources](chapters/04-details-about-api-blueprint-and-dredd.md#resources)
		2. [Actions](chapters/04-details-about-api-blueprint-and-dredd.md#actions)
		3. [Request and Response](chapters/04-details-about-api-blueprint-and-dredd.md#request-and-response)
		4. [Models](chapters/04-details-about-api-blueprint-and-dredd.md#models)
	2. [Dredd testing process](chapters/04-details-about-api-blueprint-and-dredd.md#dredd-testing-process)
		1. [Test configuration and running](chapters/04-details-about-api-blueprint-and-dredd.md#test-configuration-and-running)
		2. [CI server integration](chapters/04-details-about-api-blueprint-and-dredd.md#ci-server-integration)
		3. [Validations](chapters/04-details-about-api-blueprint-and-dredd.md#validations)
5. [Creation of scenario testing tool](chapters/05-creation-of-scenario-testing-tool.md)
	1. [Requirements](chapters/05-creation-of-scenario-testing-tool.md#requirements)
	2. [Implementation possibilities](chapters/05-creation-of-scenario-testing-tool.md#implementation-possibilities)
	3. [Implementation of proof of concept for scenario testing tool using Cucumber](chapters/05-creation-of-scenario-testing-tool.md#implementation-of-proof-of-concept-for-scenario-testing-tool-using-Cucumber)
	4. [Improvements and refactoring of the scenario testing tool](chapters/05-creation-of-scenario-testing-tool.md#improvements-and-refactoring-of-the-scenario-testing-tool)
	5. [Testing of scenario testing tool](chapters/05-creation-of-scenario-testing-tool.md#testing-of-scenario-testing-tool)
6. [Conclusion](chapters/06-conclusion.md)
7. [Installation and an example of usage](chapters/A-installation-and-usage.md)
8. [Bibliography](#bibliography)

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
- [15]<a name="DreddHooks"></a>: *Dredd hooks*. 2014. (https://github.com/apiaryio/dredd/wiki/Writing-Hooks)
- [16]<a name="DreddAllTransHook"></a>: *Dredd ALL transactions hook*. 2014. (https://github.com/apiaryio/dredd/issues/63)
- [17]<a name="Gavel"></a>: *Gavel*. (https://www.relishapp.com/apiary/gavel/docs)
- [18]<a name="Amanda"></a>: *Amanda*. (https://github.com/apiaryio/Amanda)
- [19]<a name="CoffeeScript"></a>: *http://coffeescript.org/*. (http://coffeescript.org)
- [20]<a name="Apiary"></a>: *Apiary*. (http://apiary.io)
- [21]<a name="Selenium"></a>: *Selenium*. (http://docs.seleniumhq.org)
- [22]<a name="balanced-api"></a>: *Balanced API*. (https://github.com/balanced/balanced-api)
- [23]<a name="Buster"></a>: *Buster.js*. (http://docs.busterjs.org/en/v0.7.x)
- [24]<a name="Jasmine"></a>: *Jasmine*. (http://jasmine.github.io)
- [25]<a name="Chai"></a>: *Chai*. (http://chaijs.com)
- [26]<a name="Mocha"></a>: *Mocha*. (http://visionmedia.github.io/mocha)
- [27]<a name="Gherkin"></a>: *Gherkin*. (https://github.com/cucumber/gherkin)
- [28]<a name="Protagonist"></a>: *Protagonist*. (https://github.com/apiaryio/protagonist)
- [29]<a name="Node"></a>: *Node.js*. (http://nodejs.org)
- [30]<a name="express"></a>: *express*. (http://expressjs.com)
- [31]<a name="nock"></a>: *Nock*. (https://github.com/pgte/nock)
- [32]<a name="RFC3986"></a>: T. Berners-Lee; R. Fielding; L. Masinter. *Uniform Resource Identifier (URI): Generic Syntax*. 2005. (http://www.ietf.org/rfc/rfc3986.txt)
- [33]<a name="NPM"></a>: *NPM*. (https://www.npmjs.org)

```
@todo Find some articles or books about software testing and testing process
```
```
@todo Provide more details about references if possible
```
