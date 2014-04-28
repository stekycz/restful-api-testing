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

### Implementation of proof of concept for scenario testing tool using Cucumber

At the begining of development I wanted to create a proof of concept. It ment for me the proof that I choose well the testing tool which I want to extend. In this context it means if Cucumber[[6](../README.md/#Cucumber)] can be used for testing RESTful API.

I have decide to use CoffeeScript[[19](../README.md/#CoffeeScript)] as my primary implementation language. The reason why I choose it is very simple. I wanted to use classes and othe language structures which are not provided by JavaScript. It is also used for implementation of Dredd so I could look to exists code for some help if I get to a stop point. The last reason why I choose is that I have not use it before so I could find out how good or bad it is.

At first I created a few tests in Gherkin[[27](../README.md/#Gherkin)] to be prepared for testing. I will describe testing later in this chapter so I will leave it now.

The main advantage of the new testing tool should be loading of defined RESTful API from API Blueprint file. To allow it I used Protagonist[[28](../README.md/#Protagonist)] library which loads API BLueprint file and returns its AST. Protagonist is developed by Apiary[[20](../README.md/#Apiary)] and it is also used by Dredd[[13](../README.md/#Dredd)].

The code is very simple. At first I require `fs` library from Node.js[[29](../README.md/#Node)] and also Protagonist.

```
fs = require 'fs'
protagonist = require 'protagonist'
```

Definition of loading function follows. It uses asynchronous method calling so it could be hard to undestand. However it should not be a problem if you know JavaScript or other similar language. The function accepts 3 arguments. The first is path to API Blueprint file. Then next argument is a callback for success which accepts loaded AST. The last argument is error callback which accepts error provided by filesystem library or by Protagonist.

The first call in the function is loading of API Blueprint file content. It uses UTF-8 encoding for load but I do not see it as problem because I feel UTF-8 as standard in these days. It is also used by Dredd[[13](../README.md/#Dredd)] which and I did not hear about any problem with it.

If loading does not fail it passes loaded content to Protagoist parse method. If everything goes well then loaded AST is passed to success callback. Otherwise it passes protagnist error to error callback.

```
load = (blueprintPath, success, error) ->
  fs.readFile blueprintPath, 'utf8', (parseError, data) ->
    return error(parseError) if parseError
    protagonist.parse data, (protagonistError, result) =>
      return error(protagonistError) if protagonistError
      success(result.ast)
```

The loading code ends with exporting loading function from the loading module.

```
module.exports = load
```

That complete logic needed to load API Blueprint AST. This is very important part so I created it as module which can be tested by its own.

However more complicated code awaited me. Cucumber is build on two concepts. The first I have already mentioned and it is a step definition. The other is a World. The World is just another name for context of test. It contains common logic for all tests and it is accessible from each step definition. A step definition is just a pattern for one line in Gherkin[[27](../README.md/#Gherkin)] file which do some prepared code.

I will prepare World class at first. The World should know all information about test state. So it stores API BLueprint AST, base URL of the endpoint, path to currently choosen action, currently building request, expected response structure and real response. All these properties could be important for all possible step definitions.

The World also contains 3 methods. The simpliest is `reset` and it is used for eresing last real response. It is needed for scenarios with more then one request and response.

The second method is used for request processing. It sanitize request configured in step definitions and then it is send to the endpoint. There is used Node.js[[29](../README.md/#Node)] library `http` for HTTP communication. The sending code follows.

```
req = http.request options, handleRequest
req.write self.request.body if self.request.body != ''
req.end()
```

The argument `options` contains preconfigured headers, host, port, path and action method for HTTP request. If the request contains something in body it is also send. A little bit more complicated is implementation of `handleRequest` callback which is called at the begining of HTTP communication.

The callback accepts response object in its argument. It prepartes some event callback to receive HTTP response. If error occures then the error callback is called immidiately. All received data are stored in external variable because data can be received in chunks. At the end of receiving process the response is saved to the World's property for last real reponse. The real response contains headers, body and response status code.

The `callback` call at the end is required by Cucumber[[6](../README.md/#Cucumber)] for correct continue in testing.

```
buffer = ''
self = this
handleRequest = (res) ->
  res.on 'data', (chunk) ->
    buffer = buffer + chunk

  req.on 'error', (error) ->
    errorCallback error if error

  res.on 'end', () ->
    self.response =
      headers: res.headers
      body: buffer
      statusCode: res.statusCode
    callback()
```

The last method in the World is `validate`. It uses Gavel[[17](../README.md/#Gavel) for validation of the last real response. There is no magic instead of processing possible errors for the output. However the code follows.

```
validate: (callback, errorCallback) ->
  real = @response
  expected = @expectedResponse
  gavel.isValid real, expected, 'response', (error, isValid) ->
    errorCallback error if error

    if isValid
      return callback()
    else
      gavel.validate real, expected, 'response'
      , (error, result) ->
        errorCallback error if error
        message = ''
        for entity, data of result
          for entityResult in data['results']
            message += entity + ": " + entityResult['message']
              + "\n"
        return errorCallback message
```

The only tricky thing is that method `isValid` does not return details about validity error. The error argument in the callback of `isValid` method is used for other then validation errors. So there is a simple logic is the test does not pass which calls method `validate` on Gavel[[17](../README.md/#Gavel) object.

Now is the time to describe some step definitions. However I would like to say that there exists 3 types of Cucumber[[6](../README.md/#Cucumber)] step definitions. They are named `Given`, `When` and `Then`. How their names suggests they are used for specific purposes.

The `Given` is used for preparing the World. These step definitions should load needed configuration, process known and tested actions which results are required for the test. I prepared two step definitions of this type which prepares the World for the test. Their code follows.

```
this.Given /^API Blueprint in file "([^"]+)"$/,
  (filepath, callback) ->
    self = this
    BlueprintLoader filepath, (ast) ->
      self.ast = ast
      callback()
    , (error) ->
      callback.fail error

this.Given /^base url (.*)$/, (baseUrl, callback) ->
  @baseUrl = url.parse baseUrl
  callback()
```

The first step definition loads API Blueprint AST for usage in the test. The API Blueprint file is something what is given for all scenarios so it should be configurable using `Given` step definition. The second is easier and it sets base URL of the endpoint. How it is visible in the code the saved value is not string but there is parsed URL object for future usage.

The next step definition is `When`. It is used to define preconditions of the part of scenario. The proof of concept contains only 2 of these step definitions however it can be used widely.

The first `When` step definition is used to select an action which should be called. The argument for action specification uses following syntax.

```
Group > Resource > Action
```

It is the same syntax which is used in Dredd hooks for actions. I choose it because it would be too complicated to try finding an action just by its name in proof of concept. The following code shows finding of the action in API Blueprint AST.

```
this.When /^I do action (.*)$/, (action, callback) ->
  @reset()
  structure = action.split /\s*>\s*/
  callback.fail 'Action path is not complete'
    if structure.length < 3

  filteredGroups = @ast.resourceGroups.filter (group) ->
    return group.name == structure[0]
  callback.fail 'Group "' + structure[0] + '" was not found'
    if filteredGroups.length < 1
  @structure.group = filteredGroups[0]

  filteredResources = @structure.group.resources.filter
    (resource) ->
      return resource.name == structure[1]
  callback.fail 'Resource "' + structure[1] + '" was not found'
    if filteredResources.length < 1
  @structure.resource = filteredResources[0]

  filteredActions = @structure.resource.actions.filter
    (action) ->
      return action.name == structure[2]
  callback.fail 'Action "' + structure[2] + '" was not found'
    if filteredActions.length < 1
  @structure.action = filteredActions[0]

  callback()
```

At the begining the state of last real response is reset. It is important for next steps because if there was a real response then it is not needed now. The code also shows that there is triggered an error if a group, a resource or an action is not found.

The second `When` step definition sets the request body for choosen action. It also allows to specify content type of the body by exact header value or by some predefined shortcut. The code is very simple and follows.

```
this.When /^the request message body is(?: (\w+))?$/,
  (contentType, body, callback) ->
    @reset()
    contentType = @contentTypes[contentType]
      if @contentTypes[contentType]?
    @request.headers['content-type'] = contentType
    @request.body = body
    callback()
```

At the begining there is `reset` method as in previous step definition. The reason why it is there too is very simple. Cucumber[[6](../README.md/#Cucumber)] does not require any order of step definitions so they should work independently on each other. So if the body step definition is written before action choosing step definition it should still work.

The last type of step definitions is `Then`. It is used for expectations for the result. It is similar to English language. Reading scenario is very simple because it looks like natural language.

I wrote 2 step definitions of this type for proof of concept version. The first one is used for assertion of the real response status code. The code follows.

```
this.Then /It should be ([^()]+)(?: \((\d+)\))?$/,
  (name, code, callback) ->
    this.expectedResponse.statusCode = parseInt code
    self = this
    @processRequest () ->
      self.validate () ->
        callback()
      , (msg) ->
        callback.fail msg
    , (msg) ->
      callback.fail msg
```

There is setup of expected response status code and then there is run method `processRequest` defined on the World. There is kind of mess in callbacks however if the process fails then the error callback is called. If the request is processed correctly then `validate` method defined on the World is called. And this method also accepts success and error callbacks. At the end if the response status code is as expected then the step definition passed.

The last step definition I wrote for proof of concept was for assertion of the response body. As same as request body step definition it also support expecting of content type. The code is very similar to the previous step definition so I will make it short.

```
this.Then /^the response message body is(?: (\w+))?$/,
  (contentType, body, callback) ->
    contentType = this.contentTypes[contentType]
      if this.contentTypes[contentType]?
    this.expectedResponse.headers['content-type'] = contentType
    this.expectedResponse.body = body
  ...
```

Code snippets mentioned here are final for the proof of concept. I iterated many times using tests to make them work. However at the end the proof of concept worked so I decide to continue with Cucumber[[6](../README.md/#Cucumber)] because it looks relatively simple to create more step definitions.

### Improvements and refactoring of the scenario testing tool

The proof of concept works relatively well however there is still much work to do. I decided to do some refactoring and tests improvements to have well tested and programmed tool.

The first part I have changed was processing of request, response and its validation. So I have set aside this code from the World to classes. These classes can be also teste separately which is very good in my opinion. I have had thoughts about future usage of all API Blueprint possibilities so I prepared these classes for more then they really do now.

The first class is `RequestBuilder`. It is simple encapsulating class around request data. So it contains host, port, method and URI template for the request. However it also stores header, body and parameters. I think the code snippet is not necessary here because it is very simple.

The second class is `RequestProcessor`. However there is nothing to say because it is just the same code as it was in the World. However it can be tested separately now.

The last class is `ResponseValidator` which uses Gavel[[17](../README.md/#Gavel) for validation. However it is also the same code from the World given aside.

The next logic I have set aside is translation of content type shortcuts to values for HTTP headers. Currently there is only JSON and XML. However there is no reason why there should not be any other. The code is also very simple.

```
contentTypes =
  json: 'application/json'
  xml: 'application/xml'

translate = (type) ->
  key = type.toLowerCase()
  type = contentTypes[key] if contentTypes[key]?
  return type

module.exports = translate
```

The only logic there is that if the type exists as a key in translation table then the translation is used. Otherwise the given value is returned.

I have also set aside the logic which find action by its path in API Blueprint AST. However the new class has the AST ast its own property because action finding can be repeated during one scenario but the AST stays the same. A testability of this code is also good improvent as in previously refactored code.

The next thing I improved is building of expected response. As same as the `RequestBuilder` it is very simple class which contains expected data for the response. However there is method `toResponseObject` which return expected response as simple object which can be used in validation.

All these changes also affected the World and step definitions so they have been updated appropriately.

I have also improved readability of the scenario by creation of response status code translator. The point of this translator is not to require number of response status code in `Then` step definition. The code of translation function is almost the same as for content type translation. However there is difference in translation table.

The translation table for response status codes is not static but it is dynamicaly build from status codes defined in `http` library in Node.js[[29](../README.md/#Node)]. It is possible to have some codes defined staticly however Node.js has very good list of responses so It think it is good enough.

One of the most visible improvement was addition of step definition for request and response headers. The implementation was very simple because I have had already prepared model classes. The code of both step definitions follows.

```
this.When /^the request message header ([\w-]+) is (.*)$/,
  (header, value, callback) ->
    @reset()
    @getRequest().setHeader header, value
    callback()

this.Then /^the response message header ([\w-]+) is (.*)$/,
  (header, value, callback) ->
    @expectedResponse.setHeader header, value
    @processRequest callback, callback.fail
```

The code shows that the pattern is very similar to both step definitions however there is a difference in the code which is done behind. I have also updated Cucumber[[6](../README.md/#Cucumber)] tests to test these step definitions.

The next simlicity I have done is loading of base URL from API Blueprint file. There is the `HOST` metadata field which can be defined. It can be overriden in the test by usage of appropriate `Given` step definition however it is not required anymore.

That is the last improvement I have done before focusing on writing this text. I have prepared partial updated which allows inheriting default headers and parameters from API BLueprint file however it is not simple issue. I have also known another 4 issues which should be done before final public release. However there is a short time so I hope I will find time to finish it after refering this thesis.

### Testing of the scenario testing tool

It could look relatively recursive to test testing tool however it is very important. The proof of concept tests were very simple. They were basicly tests written for [[6](../README.md/#Cucumber)] using implemented step definitions and the World. The only unit test tested loading of API Blueprint file. Cucumber tests were run againt to simple implementation using express[[30](../README.md/#express)] framework for Node.js[[29](../README.md/#Node)].

These tests stays in the repository because they are the only way how to test specified step definitions on the level of _integration tests_. It is also very useful as example usage of the testing tool.

However I have also wrote about testing some model classes. I have used Mocha[[26](../README.md/#Mocha)] and Chai[[25](../README.md/#Chai)] tool for these _unit tests_. They really interested me and they are also used for testing Dredd[[13](../README.md/#Dredd)]. So I could look for some inspiration to tests of it.

The most of the testing tool tests are very simple. They tries to do something and asserts if the result is as expected. It is usually if some value has been provided correctly.

Testing of this tool is surprisingly very simple but I have met 2 reltively hard problems.

The first problem was related to asynchronous methods. Mocha supports some contexts of tests which I do not fully understand. I thought I did however asynchronous calling was not so simple. The solution was not so hard. I just needed to define custom success and error callback for each test. Some assertions have been done in these callbacks. The example from API Blueprint file loader follows.

```
describe 'valid blueprint', () ->
  success = (ast) ->
    assert.fail
    assert.isObject ast
  error = (msg) ->
    assert.fail msg, null, 'should not be called'

  it 'will call success callback', () ->
    load __dirname + '/../fixtures/apiary.apib', success, error
```

As the code snippet shows there is forced fail if the error callback is called because the test expected success callback to be called only.

The other problem was in the class `RequestProcessor`. The class requires `http` library from Node.js[[29](../README.md/#Node)] which tries to call the endpoint. However there should not be an endpoint for simple _unit tests_. I have thought about some HTTP endpoint mocking tool which I could use. I have found the tool Nock[[31](../README.md/#nock)] which overrides methods in `http` library from Node.js[[29](../README.md/#Node)]. The usage of Nock was not so hard at the end however I spent a lot of time figuring out how it works because there was a problem related to its configuration.

However at the end all tests passes and the code coverage is 97% whcih is amazing in my opinion. I plan to keep so high level of code coverage with future updates and improvements.

### Examples of usage

At the end of implementation I would like to show some examples how to use the created tool. The easiest way how to start is installation of Cucumber[[6](../README.md/#Cucumber)].

```
npm install cucumber
```

Or it can be also installed globaly.

```
npm install -g cucumber
```

I will assume that the testing tool is already installed.

The next important step is to create directory for features. It should be placed in the root of a project because of easier usage. The name of direcotry is `features`.

```
mkdir features
```

Then it is possible to create first feature test.

```
$EDITOR feature/example.feature
```

Following code is the same as in tests for the testing tool.

```
Feature: Machines collection
    As an anonymous user
    I want to be able to access machine collection
    So that I can create a Machine and retrieve exists Machines

    Background:
        Given API Blueprint in file "test/fixtures/apiary.apib"
        And base url http://localhost:3333

    Scenario: Create a Machine
        When I do action Machines > Machines collection > Create a Machine
        And the request message header Accept is application/json
        And the request message body is JSON
        """
        {
            "type": "bulldozer",
            "name": "willy"
        }
        """
        Then It should be Accepted (202)
        And the response message header Content-Encoding is none
        And the response message body is JSON
        """
        {
            "message": "Accepted"
        }
        """

    Scenario: Retrieve all Machines
        When I do action Machines > Machines collection > Retrieve all Machines
        And the request message header Accept is application/json
        Then It should be Ok
        And the response message header Content-Encoding is none
        And the response message body is JSON
        """
        [{
            "_id": "52341870ed55224b15ff07ef",
            "type": "bulldozer",
            "name": "willy"
        }]
        """
```

I did not mention the Background section in the Gherkin[[27](../README.md/#Gherkin)] code above. The Background is used by all scenarios for the feature. It is good to use it to deduplicate steps in scenarios.

There is a feature test which contains two scenarios now. So it can be run.

```
cucumber.js -r ./path/to/step-definitions.coffee
```

If short call of `cucumber.js` dpes not work then it could be badly installed or use full path to the script. The same can be applied to step definitions file which is currently required to provide using the testing tool.

However it can be also passed in different way. Cucumber[[6](../README.md/#Cucumber)] loads automatically step definitions and the World from feature directory. So there can be created a file which will contain definition of classes which inherits from the World and step definitions provided by the testing tool. This is a way I personaly prefer because it is required for case of addition another custom step definitions. However it is not required for simple tests.

The output of the command above would be following on sucess.

```
...............

2 scenarios (2 passed)
15 steps (15 passed)
```

However there can be used some of other reportes which Cucumber[[6](../README.md/#Cucumber)] supports.

At the point of release the first public version I would like to be able to process following Gherkin[[27](../README.md/#Gherkin)] file. It shows some features which are not currently supported but which I want to implement.

```
Feature: Gist creation

  Background:
    Given API Blueprint in file "../api-definition.apib"
    And base url http://localhost:8080

  Scenario: Correct creation
    Given I have valid access token
    When I do action Gist > Gist collection > Create new Gist
    And parameter description is "Description of Gist"
    And parameter content is:
    """
    String content
    """
    Then It should be Created (201)
    And the response message body is application/json valid according to the schema
    When I do action Gist > Gist collection > Read all Gists
    And parameter id is 1
    Then It should be OK (200)
    And the response message body is application/json valid according to the schema
    And the response size of "data" is 1

  Scenario: Missing parameter content
    Given I have valid access token
    When I do action Gist > Gist collection > Create new Gist with the application/json body:
    """
    {
        description: "Description of Gist"
    }
    """
    Then It should be Bad Request (400)
    And the response message body is application/json valid according to the schema
    And the response message body is:
    """
    {
        status: "error",
        message: "Missing parameter content"
    }
    """

  Scenario: Missing parameter description
    Given I have valid access token
    When I do action Gist > Gist collection > Create new Gist with the JSON body:
    """
    {
        content: "String content"
    }
    """
    Then It should be Bad Request (400)
    And the response message body is JSON valid according to the schema
    And the response value of "status" is "error"
    And the response value of "message" is "Missing parameter description"
```
