## Evaluation of API Blueprint and Dredd

This chapter describes more details of API Blueprint and Dredd possibilities. A lot of these information can be found on the official web or in GitHub repository. However I want to describe it from my point of view.

### API Blueprint sytax basics

API Blueprint is a language based on Markdown syntax. The syntax is very simple and it is used for example on GitHub for writing issues and comments or on Trello. The language is focused on documenting Web service APIs, especially RESTful APIs. It allows you to write structured technical documentation and write text description in regular Markdown syntax.

The most important structures are resources and models in my opinion and I will describe its structure and usage.

#### Resources

Resources are usually designed in logical groups. As you probably know each resource could allow more methods which are called an action in terminology of API Blueprint. Resource groups, resources and actions are basic structures of API Blueprint document.

```markdown
# Group

## Resource [/posts/{id}]

### Action [GET]
```

#### Actions

Each resource could allow same parameters for all its actions. All these parameters (it means headers and models too) can be defined for whole resource so you do not need to repeat them for each action. However you can specify these parameters for each action if there are some special parameter for specific action.

```markdown
# Group

## Resource [/posts/{id}]

+ Parameters

	+ id (integer) ... Post identification number

### Action [GET]

+ Parameters

	+ fields (string) ... List of post fields to return in response
```

#### Request and Response

Every action consists of a request and its response. I highly recomend to specify at least one request and response per action because it is an example in general. You can also specify more requests and responses for each action however you should create a name for other then default request/response pair. I think this is very important to show differencies which depends on the request.

```markdown
# Group

## Resource [/posts/{id}]

+ Parameters

	+ id (integer) ... Post identification number

### Action [GET]

+ Parameters

	+ fields (string) ... List of post fields to return in response

+ Request (application/json)
+ Response 200 (application/json)
+ Request XML (application/xml)
+ Response 200 (application/xml)
```

You can specify a lot of your error responses, response content type dependency on accept header and many other features specific to your API. Each request or response supports specification of three parts. The first part is reserved for headers (e.g. HTTP headers) which are defined as simple key value list. Second part is body of the message. You can use it as plain text field or specify a structured body as JSON, XML or other format you want to use. The last part is called schema and you can specify there a JSON schema for body of message. The schema is used in Dredd and I will describe it more later in this chapter.

#### Models

Concept of models is to remove duplicities in examples. You can specify body of the response only once and use it for multiple examples for the resource. It is useful if model of response is the same for `POST` action and for `GET` action. You can also specify more models for different content types.

```markdown
# Group

## Resource [/posts/{id}]

+ Parameters

	+ id (integer) ... Post identification number

+ Model (application/json)

	{ "_id": "1234567890abcdef" }

### Action [GET]

+ Parameters

	+ fields (string) ... List of post fields to return in response

+ Request (application/json)
+ Response 200 (application/json)

	[Resource][]

+ Request XML (application/xml)
+ Response 200 (application/xml)
```

### Dredd testing process

The most important thing about Dredd is that it is not tool for testing API but for testing API Blueprint. Talking in testing terminology it is a system testing tool, not intergration testing tool. It was confusing for me at first time but after discussion with team from Apiary it becames clear to me. This is really important information because it changes meaning of testing using Dredd. I will describe Dredd in my new point of view related to differencies with previous confusing understanding.

#### Configuration

#### Test running

#### CI server integration

#### JSON schema validation
