## Creation of scenario testing tool

This chapter describes progress of development of scenario based testing tool for _RESTful API_. I will prepare some requirements at first and then I will describe a few possible ways how to implement it. At the end I will describe the most important parts of implementation and testing.

### Requirements

Following requirements are based on knowledge from previous chapters. It could looks like too long list of requirements however it is good to have very good idea what I want to do in my opinion.

#### Functional requirements

- loading of requests and responses from API Blueprint file
- sending request to an endpoint
- receiving reponse from an endpoint
- request and response headers validation
- request and response body validation
- possibility of JSON body validation against to JSON Schema[[3](../README.md/#JSONSchema)]
- response status code validation

#### Non-functional requirements

- writing of tests as simple as possible
- compatibility with at least one exists testing tool
- simple output about passing tests
- simple and useful output about failing tests
- use of API Blueprint[[36](../README.md/#APIBlueprint)] file and its AST
- use some code of Dredd[[13](../README.md/#Dredd)] if possible and useful
- support _RESTful APIs_ using HTTP[[14](../README.md/#HTTP)] only
- implementation in JavaScript or CoffeeScript[[19](../README.md/#CoffeeScript)]
- code publicable as NPM package
- thorough tests with good enough code coverage

### Implementation possibilities

At the begining I was thinking about all possible ways how I can create _RESTful API_ testing tool based on my requirements. I will describe my thoughts in this part.

#### All custom code

The first possibility is to implement everything by myself. However it is very complicated to write all assertions, loadings, output reporters and of course sending and receiving data. It would be nice if I could do it by myself but there is no time and no reason why to do that. The only reason could be if there would not be any other good enough solution. I forget for this possibility very quickly.

#### Custom code using libraries

Instead of writing everything by myself it could be easier to use exists libraries for some functionality. There is a library for loading API Blueprint[[36](../README.md/#APIBlueprint)] files, another library for sending and receiving data using HTTP[[14](../README.md/#HTTP)] and already mentioned Gavel[[17](../README.md/#Gavel)] for assertions. However I still would need to implement some output reporters and invent some way how to write a test case.

There could exist some library for testing reporter output formatters which I could use. However what style of writing tests I should invent? The simpliest way is similar to REST-assured[[8](../README.md/#rest-assured)] or frisby.js[[10](../README.md/#frisby)]. I mean writing some code using public API of the testing tool. It is good way how to write tests because it would be comfortable for programmers. However I want to create easier testing tool. I could write some custom syntax for this purpose but it is still too complicated to implement the testing tool. Custom syntax for this purpose would be a separate thesis in my opinion.

I kept this possibility as fallback if there would not be any easier possibility.

#### Extension of Dredd

The next most self-offered opportunity is use of Dredd[[13](../README.md/#Dredd)] as basic testing tool. At this point I have visited Apiary[[20](../README.md/#Apiary)] in Prague to discuss possibilities of cooperation and to discuss Dredd and its possibilities.

At these days (January 2014) I thought that Dredd[[13](../README.md/#Dredd)] was a _RESTful API_ testing tool which should support more then it did. I have talk with the team from Apiary[[20](../README.md/#Apiary)] and they explained to me that Dredd is not a _RESTful API_ testing tool but it is API Blueprint[[36](../README.md/#APIBlueprint)] testing tool. Considering this information it make sense to keep Dredd as simple as it is. It tests if documentation and description in API Blueprint file is in sync with the implementation.

At first I also wanted to make testing tool which would be at _integration tests_ level. However visit in Apiary gave me completely new point of view on _RESTful API_ testing. How I already wrote there is no reason for _integration tests_ during testing _RESTful API_. These tests can be run separately and are very similar to testing application logic without manual clicking or usage of tools similar to Selenium[[21](../README.md/#Selenium)].

At the end of visit in Apiary we concluded that extension of Dredd[[13](../README.md/#Dredd)] is not wanted. They suggested me what I want to implement is scenario testing. They also send me a link to GitHub repository balanced-api[[22](../README.md/#balanced-api)] which has scenario tests written in Cucumber[[6](../README.md/#Cucumber)]. It ispired me to think about Cucumber[[6](../README.md/#Cucumber)] as another possible tool to be extend.

#### Extension of other testing tool

I wanted to consider other tools then Cucumber[[6](../README.md/#Cucumber)] so I did some research around regular JavaScript testing frameworks. One possibility was frisby.js which I have described earlier however I think there would be too much changes to make it work with API Blueprint.

It can be confusing why I describe another set of testing tool here because I have described some _RESTful API_ testing tools in one of previous chapters. There is very important difference. The first set mentioned in second chapter contains tools which are already focused on API description or testing somehow. I have decide to use API Blueprint[[36](../README.md/#APIBlueprint)] and Dredd[[13](../README.md/#Dredd)] as the best candidate to improve its testing possibilities. I consider here which JavaScript tool is the best candidate for writing scenario testing tool using API Blueprint. Dredd can be good candidate because it already supports API Blueprint. However it should test the contract only how I already wrote. So I want to consider some other tools if they would not be better solution for implementation of scenario testing using API Blueprint.

There could be also a question why I consider JavaScript libraries only. Dredd is already written for JavaScript in CoffeeScript[[19](../README.md/#CoffeeScript)] and related libraries. I would like to use as many as possible original libraries to simplify implementation of scenario testing. I also started being more interested into this technology lately.

At the end this comparison can also be useful for me. I will definitely test the result of the implementation. So I will probably use one of these tools as well. This comparison can help me to make good decision.

##### Buster.js

This library is able to test server side and also client side. The documentations says it is well extensible and I do not see any reason why I should not beleive it. It is distributed as NPM package so the installation is very simple.

It was very simple till now. It requires some configuration file which contains some settings of testing environment. I understand there must be some way to configure testing tool but I do not understand why the configuration file is required. I would prefer some tool which has some predefined configuration. I just want to install it and try to use it for testing. If I will need some custom configuration then it should be required.

Buster[[23](../README.md/#Buster)] is similar to frisby.js[[10](../README.md/#frisby)] so the test is written in code which I do not se as simple way. It also contains predefined assetions. However I will have to add custom support of HTTP[[14](../README.md/#HTTP)] specific assetions for it. However it will be probably required for all testing tools which I will consider next.

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

I have heard about Jasmine[[24](../README.md/#Jasmine)] sometimes related to JavaScript or CoffeeScript development. It is also very simple to install it using NPM.

As same as Buster[[23](../README.md/#Buster)] it is code based testing tool. So to write a test it is required to know JavaScript language. However based on its documentation I think it supports more assertions then Buster. It also supports addition of custom assertion function or overriding of exists assertions.

The reason why it look better then Buster for me is the documentation which is relatively good and undestandable. However it is still based on code so I would rather use it for _integration tests_ or _unit tests_.

###### Advantages

- very simple usage and API
- easy installation
- highly extensible
- good documentation

###### Disadvantages

- writing tests in JavaScript code
- low level testing tool

##### Mocha and Chai

As same as both previous tools Mocha[[26](../README.md/#Mocha)] is also installable using NPM. This tool is also used for testing Dredd[[13](../README.md/#Dredd)] so I think it is not bad testing tool. Chai[[25](../README.md/#Chai)] is library which provides many assertions in its API.

The first example of usage in its documentation is the simplies I have ever seen. However it is still code based testing tool. Its API is well designed so reading of test is similar to reading English sentences. However writing could be still kind of hard.

As I expected it supports before and after hooks (separately for block and for each test in the block). There is very simple way to define pending test. It could be useful if it is needed to write the test however there is no time for implementation now. Providing empty test means it is pending test so it can be easily implemented later.

I have found very useful string diffs used in Mocha[[26](../README.md/#Mocha)]. It could be very useful for matching headers or bodies of messages during _RESTful API_ testing. At the end this tool is great alternative for mentioned Cucumber[[6](../README.md/#Cucumber)]. If developer or tester is not scared of JavaScript or CoffeeScript[[19](../README.md/#CoffeeScript)] code.

###### Advantages

- very good documentation
- powerful API
- easy installation
- long string diffs
- many different output reporters

###### Disadvantages

- writing tests in JavaScript or CoffeeScript[[19](../README.md/#CoffeeScript)]

##### Cucumber

Cucumber[[6](../README.md/#Cucumber)] is Behaviour Driven Development (BDD) tool for tests. All these test are written in almost natural language by so called _step definitions_. It is feature/scenario based testing tool.

The feature is some functionality which is wanted to be tested. The scenario is then usage of the feature. How it can be assumed there can be many scenarios binded to one feature.

Cucumber is originaly written in Ruby however there are versions for almost all often used languages like JavaScript, PHP or Java. So the library itself could be known very well for almost all developers. The version for JavaScript is easily installable using NPM as previous tools.

```bash
npm install cucumber
```

Cucumber[[6](../README.md/#Cucumber)] uses Gherkin[[27](../README.md/#Gherkin)] syntax for writing tests. The tests are very simple to write and read however there is need of written _step definitions_ which specifies actions behind each step in a scenario. It could be kind of hard if it is wanted to use it without any predefined _step definitions_ because it also requires some code in specific programming language.

###### Advantages

- writing tests in almost natural language
- tests can be used as tutorial documentation
- well known over many programming language developers
- focused on _system tests_
- relatively simple writing of _step definitions_

###### Disadvantages

- relatively verbose tests
- kind of hard usage without predefined _step definitions_

##### Summary of tools comparison

At the end I decided to use Cucumber[[6](../README.md/#Cucumber)] for _RESTful API_ testing tool because it is the tool designed mainly for _system tests_ in my opinion. I will also write some predefined _step definitions_. So first simple usage does not need to be so hard. I will describe my development progress in the next part.

The following table sumarizes comparison above for each tool. Lower number is better and higher number is worst. Popularity is taken from downloads count on NPM[[33](../README.md/#NPM)] server.

Tool name | Simplicity | Scenarios support | Popularity | Total
--------- |:----------:|:-----------------:|:----------:|:-----:
**Buster.js** | 3 | 3 | 3 | **3**
**Jasmine** | 3 | 3 | 3 | **3**
**Mocha and Chai** | 3 | 3 | 1 | **2**
**Cucumber** | 2 | 1 | 2 | **2**
[Summarizing table of JavaScript testing tools comparison][table-js-testing-tools-comparison]

### Implementation of proof of concept for scenario testing tool using Cucumber

At the begining of development I wanted to create a proof of concept. It ment for me the proof that I choose well the testing tool which I want to extend. In this context it means if Cucumber[[6](../README.md/#Cucumber)] can be used for _RESTful API_ testing.

This chapter can look confusing because there is mixed desing and implementation. However there also exists a reason for it. I want to describe the implementation as it went. I have done short iterations during development so I did short design and implementation steps.

I have decide to use CoffeeScript[[19](../README.md/#CoffeeScript)] as my primary implementation language. The reason why I choose it is very simple. I wanted to use classes and othe language structures which are not provided by JavaScript. It is also used for implementation of Dredd[[13](../README.md/#Dredd)] so I could look to exists code for some help if I get to a stop point. The last reason why I choose is that I have not use it before so I could find out how good or bad it is.

At first I created a few tests in Gherkin[[27](../README.md/#Gherkin)] to be prepared for testing. I will describe testing later in this chapter so I will leave it now.

The main advantage of the new testing tool should be loading of defined _RESTful API_ from API Blueprint[[36](../README.md/#APIBlueprint)] file. To allow it I have used Protagonist[[28](../README.md/#Protagonist)] library which loads API Blueprint file and returns its AST. Protagonist is developed by Apiary[[20](../README.md/#Apiary)] and it is also used by Dredd[[13](../README.md/#Dredd)].

The code is very simple. At first I require `fs` library from Node.js[[29](../README.md/#Node)] and also Protagonist[[28](../README.md/#Protagonist)].

```coffeescript
fs = require 'fs'
protagonist = require 'protagonist'
```

Definition of loading function follows.

```coffeescript
load = (blueprintPath, success, error) ->
  fs.readFile blueprintPath, 'utf8', (parseError, data) ->
    return error(parseError) if parseError
    protagonist.parse data, (protagonistError, result) =>
      return error(protagonistError) if protagonistError
      success(result.ast)
```

It uses asynchronous method calling so it could be hard to undestand. However it should not be a problem if you know JavaScript or other similar language. The function accepts 3 arguments. The first is path to API Blueprint[[36](../README.md/#APIBlueprint)] file. Then next argument is a callback for success which accepts loaded AST. The last argument is error callback which accepts error provided by `fs` library or by Protagonist[[28](../README.md/#Protagonist)].

The first call in the function is loading of API Blueprint[[36](../README.md/#APIBlueprint)] file content. It uses UTF-8 encoding for load but I do not see it as problem because I feel UTF-8 as standard in these days. It is also used by Dredd[[13](../README.md/#Dredd)] and I did not hear about any problem with it.

If loading does not fail it passes loaded content to Protagoist[[28](../README.md/#Protagonist)] parse method. If everything goes well then loaded AST is passed to success callback. Otherwise it passes Protagnist error to error callback.

The loading code ends with exporting loading function from the loading module.

```coffeescript
module.exports = load
```

That is complete logic needed to load API Blueprint[[36](../README.md/#APIBlueprint)] AST. This is very important part so I created it as module which can be tested by its own.

However more complicated code awaited me. Cucumber[[6](../README.md/#Cucumber)] is build on two concepts. The first I have already mentioned and it is a _step definition_. The other is the `World`. the `World` is just another name for context of test. It contains common logic for all tests and it is accessible from each _step definition_. A _step definition_ is just a pattern for one line in Gherkin[[27](../README.md/#Gherkin)] file which is "translated" to some prepared code.

I will prepare the `World` class at first. the `World` should know all information about test state. So it stores API Blueprint[[36](../README.md/#APIBlueprint)] AST, base URL of the endpoint, path to currently choosen action, currently building request, expected response structure and real response. All these properties could be important for all possible _step definitions_.

the `World` also contains 3 methods. The simpliest is `reset` and it is used for erasing last real response. It is needed for scenarios with more then one request and response.

The second method is used for request processing. It sanitize request configured in _step definitions_ and then it is send to the endpoint. There is used Node.js[[29](../README.md/#Node)] library `http` for HTTP[[14](../README.md/#HTTP)] communication. The sending code follows.

```coffeescript
req = http.request options, handleRequest
req.write self.request.body if self.request.body != ''
req.end()
```

The argument `options` contains preconfigured headers, host, port, path and action method for HTTP[[14](../README.md/#HTTP)] request. If the request contains something in body then it is also send. A little bit more complicated is implementation of `handleRequest` callback which is called at the begining of HTTP communication.

The callback accepts response object in its argument. It prepartes some event callback to receive HTTP[[14](../README.md/#HTTP)] response. If error occures then the error callback is called immediately. All received data are stored in external variable because data can be received in chunks. At the end of receiving process the response is saved to real response property of the `World`. The real response contains headers, body and response status code.

The `callback` call at the end is required by Cucumber[[6](../README.md/#Cucumber)] for correct continue in testing.

```coffeescript
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

The last method in the `World` is `validate`. It uses Gavel[[17](../README.md/#Gavel)] for validation of the last real response. There is no magic instead of processing possible errors for the output. The code follows.

```coffeescript
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

The only tricky thing is that method `isValid` does not return details about validity error. The error argument in the callback of `isValid` method is used for other then validation errors. So there is a simple logic, for case the test does not pass, which calls method `validate` on Gavel[[17](../README.md/#Gavel)] object.

Now is the time to describe some _step definitions_. However I would like to say that there exists 3 types of Cucumber[[6](../README.md/#Cucumber)] _step definitions_. They are named `Given`, `When` and `Then`. How their names suggests they are used for specific purposes.

The `Given` is used for preparing the `World`. These _step definitions_ should load needed configuration and process known and tested actions because their results are required for the test. I prepared two _step definitions_ of this type which prepares the `World` for the test. Their code follows.

```coffeescript
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

The first _step definition_ loads API Blueprint[[36](../README.md/#APIBlueprint)] AST for usage in the test. The API Blueprint file is something what is given for all scenarios so it should be configurable using `Given` _step definition_.

The second _step definition_ is easier and it sets base URL of the endpoint. How it is visible in the code the saved value is not string but there is parsed URL object for future usage.

The next _step definition_ is `When`. It is used to define preconditions of the part of scenario. The proof of concept contains only 2 of these _step definitions_ however it can be used widely.

The first `When` _step definition_ is used to select an action which should be called. The argument for action specification uses following syntax.

```
Group > Resource > Action
```

It is the same syntax which is used in Dredd[[13](../README.md/#Dredd)] hooks for actions. I choose it because it would be too complicated to try finding an action just by its name in proof of concept. The following code shows finding of the action in API Blueprint[[36](../README.md/#APIBlueprint)] AST.

```coffeescript
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

The second `When` _step definition_ sets the request body for choosen action. It also allows to specify content type of the body by exact header value or by some predefined shortcut. The code is very simple and follows.

```coffeescript
this.When /^the request message body is(?: (\w+))?$/,
  (contentType, body, callback) ->
    @reset()
    contentType = @contentTypes[contentType]
      if @contentTypes[contentType]?
    @request.headers['content-type'] = contentType
    @request.body = body
    callback()
```

At the begining there is `reset` method as in previous _step definition_. The reason why it is there too is very simple. Cucumber[[6](../README.md/#Cucumber)] does not require any order of _step definitions_ so they should work independently on each other. So if the body _step definition_ is written before action choosing _step definition_ it should still work.

The last type of _step definitions_ is `Then`. It is used for expectations of the result. It is similar to English language. Reading scenario is very simple because it looks like natural language.

I wrote 2 _step definitions_ of this type for proof of concept version. The first one is used for assertion of the real response status code. The code follows.

```coffeescript
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

There is setup of expected response status code and then there is run method `processRequest` defined on the `World`. There is kind of mess in callbacks however if the process fails then the error callback is called. If the request is processed correctly then `validate` method defined on the `World` is called. And this method also accepts success and error callbacks. At the end if the response status code is as expected then the _step definition_ passed.

The last _step definition_ I wrote for proof of concept us used for assertion of the response body. As same as request body _step definition_ it also support expecting of content type. The code is very similar to the previous _step definition_ so I will make it short.

```coffeescript
this.Then /^the response message body is(?: (\w+))?$/,
  (contentType, body, callback) ->
    contentType = this.contentTypes[contentType]
      if this.contentTypes[contentType]?
    this.expectedResponse.headers['content-type'] = contentType
    this.expectedResponse.body = body
  ...
```

Code snippets mentioned here are final for the proof of concept. I iterated many times using tests to make them work. However at the end the proof of concept worked. So I decide to continue with Cucumber[[6](../README.md/#Cucumber)] because it looks relatively simple to create more _step definitions_.

### Improvements and refactoring of the scenario testing tool

The proof of concept works relatively well however there is still much work to do. I decided to do some refactoring and tests improvements to have well tested and programmed tool.

The first part I have changed was processing of request, response and its validation. So I have set aside this code from the `World` to its own classes. These classes can be also tested separately what is very good in my opinion. I have had thoughts about future usage of all API Blueprint[[36](../README.md/#APIBlueprint)] possibilities so I prepared these classes for more then they really do now.

The first class is `RequestBuilder`. It is simple encapsulating class around request data. So it contains host, port, method and URI template for the request. However it also stores headers, body and parameters. I think the code snippet is not necessary here because it is very simple.

The second class is `RequestProcessor`. However there is nothing to say because it is just the same code as it was in the `World`. However it can be tested separately now.

The last class is `ResponseValidator` which uses Gavel[[17](../README.md/#Gavel)] for validation. However it is also the same code from the `World` given aside.

The next logic I have set aside is translation of content type shortcuts to values for HTTP[[14](../README.md/#HTTP)] headers. Currently there is only JSON and XML. However there is no reason why there should not be any other. The code is also very simple.

```coffeescript
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

I have also set aside the logic which find action by its path in API Blueprint[[36](../README.md/#APIBlueprint)] AST. However the new class has the AST as its own property. The reason is that action finding can be repeated during one scenario but the AST stays the same. A testability of this code is also good improvement as in previously refactored code.

The next thing I improved is building of expected response. As same as the `RequestBuilder` it is very simple class which contains expected data for the response. However there is method `toResponseObject` which returns expected response as simple JSON which can be used in validation.

All these changes also affected the `World` and _step definitions_ so they have been updated appropriately.

I have also improved readability of the scenario by creation of response status code translator. The point of this translator is not to require number of response status code in `Then` _step definition_. The code of translation function is almost the same as for content type translation. However there is difference in translation table.

The translation table for response status codes is not static but it is dynamicaly build from status codes defined in `http` library in Node.js[[29](../README.md/#Node)]. It is possible to have some codes defined staticly however Node.js has very good list of responses. It is good enough now in my opinion.

One of the most visible improvement was addition of _step definition_ for request and response headers. The implementation was very simple because I have had already prepared model classes. The code of both _step definitions_ follows.

```coffeescript
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

The code shows that the pattern is very similar to both _step definitions_. However there is a difference in the code which is done behind. I have also updated Cucumber[[6](../README.md/#Cucumber)] tests to test these _step definitions_.

The next simlicity I have done is loading of base URL from API Blueprint[[36](../README.md/#APIBlueprint)] file. There is the `HOST` metadata field which can be defined. It can be overriden in the test by usage of appropriate `Given` _step definition_ however it is not required anymore.

That is the last improvement I have done before focusing on writing this text. I have prepared partial update which allows inheriting default headers and parameters from API Blueprint[[36](../README.md/#APIBlueprint)] file however it is not simple issue. I laso have another 4 known issues which should be done before final public release. However there is a short time so I hope I will find time to finish it after refering this thesis.

### Testing of the scenario testing tool

It could look relatively recursive to test testing tool however it is very important. The proof of concept tests were very simple. They were basicly tests written for [[6](../README.md/#Cucumber)] using implemented _step definitions_ and the `World`. The only unit test tested loading of API Blueprint[[36](../README.md/#APIBlueprint)] file. Cucumber tests were run against to simple implementation using express[[30](../README.md/#express)] framework for Node.js[[29](../README.md/#Node)].

These tests stays in the repository because they are the only way how to test specified _step definitions_ on the level of _integration tests_ and _system tests_. It is also very useful as example usage of the testing tool.

However I have also wrote about testing some model classes. I have used Mocha[[26](../README.md/#Mocha)] and Chai[[25](../README.md/#Chai)] tools for these _unit tests_. They really interested me and they are also used for testing Dredd[[13](../README.md/#Dredd)]. So I could look for some inspiration to tests of Dredd.

The most of the testing tool tests are very simple. They tries to do something and asserts if the result is as expected. It is usually assertion that some value has been provided correctly.

Testing of this tool is surprisingly very simple but I have met 2 relatively hard problems.

The first problem was related to asynchronous methods. Mocha supports some contexts of tests which I do not fully understand. I thought I did however asynchronous calling was not so simple. The solution was not so hard. I just needed to define custom success and error callback for each test. Some assertions have been done in these callbacks. The example from API Blueprint[[36](../README.md/#APIBlueprint)] file loader follows.

```coffeescript
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

The other problem was in the class `RequestProcessor`. The class requires `http` library from Node.js[[29](../README.md/#Node)] which tries to call the endpoint. However there should not be an endpoint for simple _unit tests_. I have thought about some HTTP[[14](../README.md/#HTTP)] endpoint mocking tool which I could use. I have found the tool Nock[[31](../README.md/#nock)] which overrides methods in `http` library from Node.js[[29](../README.md/#Node)]. The usage of Nock was not so hard at the end. However I spent a lot of time figuring out how it works because there was a problem related to its configuration.

However at the end all tests passes and the code coverage is 97%. It is amazing in my opinion. I plan to keep so high level of code coverage with future updates and improvements.

The tool is not completed in my opinion. There are some features which should be implemented soon. Current solution supports complete testing relatively well. The biggest disadvantage is that there is no inheritance of request and response parameters, headers etc. However it supports configuration of whole HTTP[[14](../README.md/#HTTP)] request and it is possible to validate its response.

At the point of release the first public version I would like to be able to process following Gherkin[[27](../README.md/#Gherkin)] file. It shows some features which are not currently supported but which I want to implement.

```gherkin
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
    And the response message body is application/json valid
      according to the schema
    When I do action Gist > Gist collection > Read all Gists
    And parameter id is 1
    Then It should be OK (200)
    And the response message body is application/json valid
      according to the schema
    And the response size of "data" is 1

  Scenario: Missing parameter content
    Given I have valid access token
    When I do action Gist > Gist collection > Create new Gist
      with the application/json body:
    """
    {
        description: "Description of Gist"
    }
    """
    Then It should be Bad Request (400)
    And the response message body is application/json valid
      according to the schema
    And the response message body is:
    """
    {
        status: "error",
        message: "Missing parameter content"
    }
    """

  Scenario: Missing parameter description
    Given I have valid access token
    When I do action Gist > Gist collection > Create new Gist
      with the JSON body:
    """
    {
        content: "String content"
    }
    """
    Then It should be Bad Request (400)
    And the response message body is JSON valid
      according to the schema
    And the response value of "status" is "error"
    And the response value of "message" is "Missing
      parameter description"
```
