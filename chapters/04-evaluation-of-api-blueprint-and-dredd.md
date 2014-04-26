## Evaluation of API Blueprint and Dredd

This chapter describes more details of API Blueprint and Dredd possibilities. A lot of these information can be found on the official web or in GitHub repository. However I want to describe it from my point of view.

### API Blueprint sytax basics

API Blueprint is Web API documentation language based on Markdown syntax. The syntax is very simple and it is used for example on GitHub[[5](../README.md/#GitHub)] for writing issues and comments or on Trello[[4](../README.md/#Trello)]. The language is focused on documenting Web service APIs, especially RESTful APIs. It allows writing structured technical documentation and write text description in regular Markdown syntax.

The most important structures are resources and partialy models in my opinion. I will describe its structure and usage in first half of this chapter.

#### Resources

Resources are usually designed in logical groups. As you probably know each resource could allow more methods which are called an action in terminology of API Blueprint. Resource groups, resources and actions are basic structures of API Blueprint document. An example follows.

```
# Group

## Resource [/posts/{id}]

### Action [GET]
```

#### Actions

Each resource could allow same parameters for all its actions. All these parameters (it means headers and models too) can be defined for whole resource so you do not need to repeat them for each action. However you can specify these parameters for each action if there are some special parameter for specific action (for example list of selecting fields for `GET` method).

```
# Group

## Resource [/posts/{id}]

+ Parameters

    + id (integer) ... Post identification number

### Action [PUT]

### Action [GET]

+ Parameters

    + fields (string) ... List of post fields to return in response
```

#### Request and Response

Every action consists of a request and its response. I highly recomend to specify at least one request and response per action because it is an example in general. You can also specify more requests and responses for each action however you should create a name for the others. The original request/response pair does not need a name. I it is very important to show differencies which depends on the request parameters so it will be visible how `Accept` header changes the response.

```
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

It is possible to specify a lot of own error responses, response content type dependency on accept header and many other features API specific. Each request or response supports specification of three parts. The first part is reserved for headers (e.g. HTTP headers) which can be defined as simple key value list. Second part is indended for body of the message. You can use it as plain text field or specify a structured body as JSON, XML or other format is used in the API. The last part is called schema and you can specify there a JSON schema[[5](../README.md/#JSONSchema)] for body of the message. The schema is used in Dredd and I will describe it more later in this chapter.

Full example of all mentioned possibilities follows.

```
# Group

## Resource [/posts/{id}]

+ Parameters

    + id (required, integer, `1`) ... Post identification number

### Action [GET]

+ Parameters

    + fields (optional, string) ... List of post fields to return in response

+ Request (application/json)
+ Response 200 (application/json)

    + Headers

            ETag: 737060cd8c284d8af7ad3082f209582d
            Last-Modified: Sat, 26 Apr 2014 21:47:31 GMT
            Content-Length: 40
            Link: <http://www.example.com/posts/1>; rel="self"

    + Body

            {
                "id": 1,
                "content": "<p>Hello world!</p>"
            }

+ Request XML (application/xml)
+ Response 200 (application/xml)

    + Headers

            ETag: 737060cd8c284d8af7ad3082f209582d
            Last-Modified: Sat, 26 Apr 2014 21:47:31 GMT
            Content-Length: 40
            Link: <http://www.example.com/posts/1>; rel="self"

    + Body

            <?xml version="1.0" encoding="UTF-8"?>
            <post>
                <id>1</id>
                <content><p>Hello world!</p></content>
            </post>
```

#### Models

Concept of models is to remove duplicated structures in examples. You can specify body of the response only once and use it for multiple examples for the resource. It is useful if model of response is the same for `POST` action and for `GET` action. However current version of API Blueprint allows only one model per resource. I think it is not problem for many APIs however it could be useful to have more models for more content types.

```
# Group

## Resource [/posts/{id}]

+ Parameters

    + id (required, integer, `1`) ... Post identification number

+ Model (application/json)

        {
            "id": 1,
            "content": "<p>Hello world!</p>"
        }

### Action [GET]

+ Parameters

    + fields (optional, string) ... List of post fields to return in response

+ Request (application/json)
+ Response 200 (application/json)

    [Resource][JSON]

+ Request XML (application/xml)
+ Response 200 (application/xml)

    + Body

            <?xml version="1.0" encoding="UTF-8"?>
            <post>
                <id>1</id>
                <content><p>Hello world!</p></content>
            </post>
```

### Dredd testing process

The most important thing about Dredd is that it is not tool for testing API but for testing API Blueprint. Talking in testing terminology it is a system testing tool, not intergration testing tool. It was confusing for me at first time but after discussion with team from Apiary it becames clear to me. This is really important information because it changes meaning of testing using Dredd. I will describe Dredd in my new point of view related to differencies with previous confusing understanding.

#### Configuration

#### Test running

#### CI server integration

#### JSON schema validation
