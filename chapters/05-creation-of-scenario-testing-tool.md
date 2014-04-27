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

There could exist some library for testing reporter output formatters which I could use. However what style of writing tests I could invent? The simpliest way is similar to REST-assured[[8](../README.md/#rest-assured) or frisby.js[[10](../README.md/#frisby). I mean writing some code using public API of the testing tool. It is a good way how to write tests because it would be comfortable for programmers. I could write some custom syntax for this purpose but it is still too complicated to implement the testing tool. Custom syntax for this purpose would be a separate thesis in my opinion.

I kept this possibility as fallback if there would not be any easier possibility.

#### Extension of Dredd

The next most self-offered opportunity is use of Dredd as basic testing tool. At this point I have visit Apiary[[20](../README.md/#Apiary) in Prague to discuss possibilities of cooperation and discuss about Dredd.

At these days (January 2014) I thought that Dredd is an RESTful API testing tool which should support more then it did. I have talk with people from Apiary[[20](../README.md/#Apiary) and they explained to me that Dredd is not a RESTful API testing tool but it is a API Blueprint testing tool. Considering this information it make sense to keep Dredd as simple as it is. It tests if documentation and description in API Blueprint file is in sync with implementation.

At first I also wanted to make testing tool which would be at _integration tests_ level. However visit in Apiary gave me completely new point of view on RESTful API testing. How I already wrote there is no reason for _integration tests_ during testing RESTful API. These tests can be run separately and are very similar to testing application logic without manual clicking or usage of tools similar to Selenium[[21](../README.md/#Selenium).

At the end of visit in Apiary we concluded that extension of Dredd is not wanted. They suggested me what I want to test are scenarios. They also send me a link to GitHub repository balanced-api[[22](../README.md/#balanced-api) which has scenario tests written in Cucumber[[6](../README.md/#Cucumber). It ispired me to think about Cucumber as another possible tool to be extend.

#### Extension of other testing tool

### Implementation of scenario testing tool

### Testing of scenario testing tool

### Examples of usage
