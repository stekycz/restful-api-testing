## Creation of scenario testing tool

This chapter describes progress of development of scenario based testing tool for RESTful API. I will prepare some requirements at first and then I will describe a few possible way how to implement it. At the end I will describe the most important parts of implementation, testing and examples of usage.

### Requirements

Following requirements are based on knowledge from previous chapters. It could looks like too long list of requirements however I think it is good to have very good idea what I want to do.

#### Functional requirements

- Loading of requests/responses from API Blueprint file
- Sending request to an endpoint
- Receiving reponse from an endpoint
- Request/response headers validation
- Request/response body validation
- Possibility od JSON body validation against to JSON Schema[[3](../README.md/#JSONSchema)]
- Response status code validation

#### Non-functional requirements

- Writing of tests as simple as possible
- Compatibility with at least one exists testing tool
- Simple output about passing tests
- Simple and useful output about failing tests
- Use of API Blueprint file and its AST
- Use some code of Dredd if possible and useful
- Support RESTful APIs using HTTP only
- Implementation in JavaScript or CoffeeScript[[19](../README.md/#CoffeeScript)]
- Code publicable as NPM package
- Thorough tests with good enough code coverage

### Implementation possibilities

At the begining I was thinking about all possible ways how I can create RESTful API testing tool based on my requirements. I will describe my thoughts in this part.

#### All custom code

The first possibility is to implement everything by myself. However it is very complicated to write all assertions, loadings, output reporters and of course sending and receiving data. It would be nice if I could do it by myself but there is no time and no reason why to do that. The only reason could be if there would not be any other good enough solution. I forget for this possibility very quickly.

#### Custom code using libraries

Instead of writing everything by myself it could be easier to use exists libraries for some functionality. There is a library for loading API Blueprint files, another library for sending and receiving data using HTTP and already mentioned Gavel[[17](../README.md/#Gavel) for assertions. However I still would need to implement some output reporters and invent some way how to write a test case.

There could exist some library for testing reporter output formatters which I could use. However what style of writing tests I could invent? The simpliest way is similar to REST-assured[[8](../README.md/#rest-assured)] or frisby.js[[10](../README.md/#frisby)]. I mean writing some code using public API of the testing tool. It is a good way how to write tests because it would be comfortable for programmers. I could write some custom syntax for this purpose but it is still too complicated to implement the testing tool. Custom syntax for this purpose would be a separate thesis in my opinion.

I kept this possibility as fallback if there would not be any easier possibility.

#### Extension of Dredd

The next most self-offered opportunity is use of Dredd as basic testing tool. At this point I have visit Apiary[[20](../README.md/#Apiary)] in Prague to discuss possibilities of cooperation and discuss about Dredd.

At these days (January 2014) I thought that Dredd is an RESTful API testing tool which should support more then it did. I have talk with people from Apiary[[20](../README.md/#Apiary)] and they explained to me that Dredd is not a RESTful API testing tool but it is a API Blueprint testing tool. Considering this information it make sense to keep Dredd as simple as it is. It tests if documentation and description in API Blueprint file is in sync with implementation.

At first I also wanted to make testing tool which would be at _integration tests_ level. However visit in Apiary gave me completely new point of view on RESTful API testing. How I already wrote there is no reason for _integration tests_ during testing RESTful API. These tests can be run separately and are very similar to testing application logic without manual clicking or usage of tools similar to Selenium[[21](../README.md/#Selenium)].

At the end of visit in Apiary we concluded that extension of Dredd is not wanted. They suggested me what I want to test are scenarios. They also send me a link to GitHub repository balanced-api[[22](../README.md/#balanced-api)] which has scenario tests written in Cucumber[[6](../README.md/#Cucumber)]. It ispired me to think about Cucumber as another possible tool to be extend.

#### Extension of other testing tool

I wanted to consider other tools then Cucumber[[6](../README.md/#Cucumber)] so I did some research around regular JavaScript testing frameworks. One possibility was frisby.js which I have described earlier however I think there would be too much changes to make it work with API Blueprint.

##### Buster.js

This library is able to test server side and also client side. The documentations says it is well extensible and I do not see any reason why I should not beleive it. It is distributed as NPM package so the installation is very simple.

It was very simple till now. It requires some configuration file which contains some settings of testing environment. I understand thery must be some way to configure testing tool but I do not understand why the configuration file is needed. I would prefer some tool which has some predefined configuration. I just want to install it and use for testing.

Buster[[23](../README.md/#Buster)] is similar to frisby.js[[10](../README.md/#frisby)] so the test is written in code which I do not se as simple way. It also contains predefined assetions however I will have to add custom support of HTTP specific assetions for it. However it will be probably required for all testing tools I will consider next.

At the end I think this tool is designed for relatively low level usage. It should be used for _unit tests_ or for _integration tests_.

###### Advantages

- testing server side and client side
- easy installation
- well configurable and extensible

###### Disadvantages

- requirement of configuration file
- writing tests in JavaScript code
- low level testing tool

##### Jasmine

I have heard about Jasmine[[24](../README.md/#Jasmine)] many times related to JavaScript or CoffeeScript development. It is also very simple to install it using NPM.

As same as Buster is is code based testing tool. So to write a test it is required to know JavaScript language. However based on its documentation I think it supports more assertions then Buster. It also support addition of custom assertion function or overriding of exists assertions.

The reason why I think it look better then Buster me is the documentation which is relatively good and undestandable. However it is still based on code so I would rather use it for _integration tests_ or _unit tests_.

###### Advantages

- very simple usage and API
- easy installation
- highly extensible

###### Disadvantages

- writing tests in JavaScript code
- low level testing tool

##### Mocha and Chai

As same as both previous tools Mocha[[26](../README.md/#Mocha)] is also installable using NPM. This tool is also used for testing Dredd so I think it is not bad testing tool. Chai[[25](../README.md/#Chai)] is library which provides many assertions in its API.

The first example of usage in its documentation is the simplies I have ever seen. However it is still code based testing tool. Its API is wel designed so reading of test is similar to reading English sentences. However writing could be still painful.

As I expected it supports before and after hooks (separately for block and for each test in the block). There is a very easy way to define pending test. It could be useful if it is needed to write the test however there is no time now. Providing empty test means it is pending test so it can be easily finished later.

I have found very useful string diffs used in Mocha[[26](../README.md/#Mocha)]. It could be very useful for matching headers or bodies of messages during RESTful API testing. At the end this tool is great alternative to mentioned Cucumber[[6](../README.md/#Cucumber)] if you are not scared by JavaScript or CoffeeScript[[19](../README.md/#CoffeeScript)] code.

###### Advantages

- very good documentation
- powerful API
- easy installation
- long string diffs
- many different output reporters

###### Disadvantages

- writing tests in JavaScript or CoffeeScript[[19](../README.md/#CoffeeScript)]

##### Cucumber

Cucumber[[6](../README.md/#Cucumber)] is behaviour driven development tool for tests. All these test are written in natural language by so called step definitions. It is feature/scenario based testing tool.

The feature is some functionality which is wanted to be tested. The scenario is then usage of the feature. How it can be assumed there can be many scenarios binded to one feature.

Cucumber is originaly written in Ruby however there is a porated version for almost all often used languages like JavaScript, PHP and Java. So the library itself could be known very well for almost all developers. The version for JavaScript is easily installable using NPM as previous tools.

```
npm install cucumber
```

However Cucumber uses Gherkin[[27](../README.md/#Gherkin)] syntax for writing tests. The tests are very simple to write and read however there is need of written step definitions which specifies actions behind for each step in a scenario. It could be painful if you want to use it without any predefined step definitions because it also requires some code in specific programming language.

At the end I decided to use Cucumber[[6](../README.md/#Cucumber)] for RESTful API testing tool because it is the tool designed mainly for _system tests_ in my opinion. I will also write some predefined step definitions so first simple usage does not need to be so painful. I will describe my development progress in the next part.

###### Advantages

- writing tests in almost natural language
- tests can be used as tutorial documentation
- well known over many programming language developers
- focused on _system tests_
- relatively simple writing of step definitions

###### Disadvantages

- relatively verbose tests
- painful usage without predefined step definitions

### Implementation of scenario testing tool

### Testing of scenario testing tool

### Examples of usage
