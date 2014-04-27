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

### Implementation of scenario testing tool

### Testing of scenario testing tool

### Examples of usage
