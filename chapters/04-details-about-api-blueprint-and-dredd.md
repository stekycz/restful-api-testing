## Details about API Blueprint and Dredd

This chapter describes more details of API Blueprint[[36](../README.md/#APIBlueprint)] and Dredd[[13](../README.md/#Dredd)] possibilities. A lot of these information can be found on the official web or in the GitHub repository. However I want to describe it from my point of view.

These information would be used in the next chapter where I will focus on some improvements. The improvement can be related to API Blueprint or Dredd. So it should be described in detail in my opinion. These information will be also used for decision how to improve testing process using these tools.

### API Blueprint sytax basics

API Blueprint[[36](../README.md/#APIBlueprint)] is Web API documentation language based on Markdown syntax. The syntax[[2](../README.md/#APIBlueprintSpecification)] is very simple and it is used for example on GitHub[[5](../README.md/#GitHub)] for writing issues and comments or on Trello[[4](../README.md/#Trello)]. The language is focused on documenting Web service APIs, especially _RESTful API_s. It allows writing structured technical documentation and write text description in regular Markdown syntax.

The most important structures are resources and partialy models in my opinion. I will describe its structure and usage in first half of this chapter. All examples here can be wrapped because of page width or readability.

#### Resources

Resources are usually designed in logical groups. As it is probably known each resource could allow more methods which are called an action in terminology of API Blueprint[[36](../README.md/#APIBlueprint)]. Resource groups, resources and actions are basic structures of API Blueprint document. An example follows.

```
# Group
## Resource [/posts/{id}]
### Action [GET]
```

#### Actions

Each resource could allow same parameters for all its actions. All these parameters (it means headers and models too) can be defined for whole resource so it is not needed to repeat them for each action. However it is possible to specify these parameters for each action if there are some special parameter for specific action (for example list of selecting fields for `GET` method).

```
# Group

## Resource [/posts/{id}]

+ Parameters

    + id (integer) ... Post identification number

### Action [PUT]

### Action [GET]

+ Parameters

    + fields (string) ... List of post fields to return
                          in response
```

#### Request and Response

Every action consists of a request and its response. I highly recommend to specify at least one request and response per action as an example. You can also specify more requests and responses for each action. However you should create a name for the others. The original request/response pair does not need any name. I it is very important to show differences which depends on request parameters. So it will be visible how `Accept` header changes the response.

```
# Group

## Resource [/posts/{id}]

+ Parameters

    + id (integer) ... Post identification number

### Action [GET]

+ Parameters

    + fields (string) ... List of post fields to return
                          in response

+ Request (application/json)
+ Response 200 (application/json)

+ Request XML (application/xml)
+ Response 200 (application/xml)
```

It is possible to specify a lot of custom error responses, response content type dependency on accept header and many other features API specific. Each request or response supports specification of three parts. The first part is reserved for headers (e.g. HTTP headers) which can be defined as simple key value list. Second part is indented for the message body. It can be also used as plain text field or specify a structured body as JSON, XML or other format is used in the API. The last part is called schema and you can specify a JSON schema[[5](../README.md/#JSONSchema)] for the message body there. The schema is used in Dredd and I will describe it more later in this chapter.

Full example of all mentioned possibilities follows.

```
# Group

## Resource [/posts/{id}]

+ Parameters

    + id (required, integer, `1`) ... Post identification number

### Action [GET]

+ Parameters

    + fields (optional, string) ... List of post fields to return
                                    in response

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

Concept of models is to remove duplicated structures in examples. You can specify body of the response only once and use it for multiple examples for the resource. It is useful if model of response is the same for many actions. However current version of API Blueprint[[36](../README.md/#APIBlueprint)] allows only one model per resource. It is not problem for many APIs in my opinion however it could be useful to have more models for more content types.

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

    + fields (optional, string) ... List of post fields to return
                                    in response

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

The most important thing about Dredd[[13](../README.md/#Dredd)] is that it is not tool for testing API but for testing API Blueprint[[36](../README.md/#APIBlueprint)]. So it does not test any functionality, side effects or scenarios. The primary target of this testing tool is to validate implemented API againt to API Blueprint. It was confusing for me at first time but after discussion with team from Apiary it becames clear to me. This is really important information because it changes meaning of testing using Dredd. I will describe Dredd in my new point of view. However I will points to differences with my previous confusing understanding to explain what Dredd really is.

#### Test configuration and running

Dredd supports running from CLI only now. It is not problem in my opinion because it is usually wanted to run it on CI server which also uses CLI to run tests. The mask of command is following.

```bash
dredd <path to blueprint> <api_endpoint> [OPTIONS]
```

There are two required arguments - path to API Blueprint[[36](../README.md/#APIBlueprint)] file which specifies interface of tested API and API endpoint to which dredd will send testing requests. There is also many other options but usually only a few will be used often in my opinion.

Before running Dredd[[13](../README.md/#Dredd)] there is need to know on which URI the endpoint will be available or where it already runs. That is the worst possibility of testing which I have describe in chapter about testing process of _RESTful API_. If some test changes data behind the endpoint then next tests could fail. However Dredd supports option `--sorted, -s` which runs requests to one resource in predefined order of methods. The order currently (27<sup>th</sup> April 2014) is `CONNECT, OPTIONS, POST, GET, HEAD, PUT, PATCH, DELETE, TRACE`.

Dredd[[13](../README.md/#Dredd)] also supports hooks written in JavaScript or CofeeScript. These hooks can be configured for Dredd using option `--hookfiles, -f` which specifies a mask for hook files so it is possible to have each hook in its own file. This feature has been introduced two months ago (February 2014).

An example of hooks from GitHub Dredd wiki[[15](../README.md/#DreddHooks)] (current to 27<sup>th</sup> April 2014).

```coffeescript
{before, after} = require 'hooks'

before "Machines > Machines collection > Get Machines",
  (transaction) ->
    console.log "before"

after "Machines > Machines collection > Get Machines",
  (transaction) ->
    console.log "after"
```

Hooks are very useful however there are some limitations now. For example there is no simple way to define one hook for all transactions. There also exists an issue with discussion about it[[16](../README.md/#DreddAllTransHook)]. So the example above shows one hook for transaction "Get Machines".

The transaction in this context means one real request and its response. Dredd[[13](../README.md/#Dredd)] uses API Blueprint[[36](../README.md/#APIBlueprint)] examples for this purpose. It loads whole API Blueprint file and the it prepares transactions to run. The transaction is created from one pair of request and response example for each action. This is very important because it requires correct order of example requests and its responses in the API Blueprint file.

Other useful options are `--header, -h` and `--user, -u`. The first option can add HTTP header to all requests so it is possible to filter testing traffic on the endpoint for example. The second option is used for Basic Auth credentials which can be useful for restricted endpoint access. Credentials should be passed in the form `username:password`.

There is also one option which can be useful for validation of prepared Dredd testing process. It is `--dry-run` which does not send any request. It does not do any test but its advantage is in validation of other parameters, API Blueprint file etc.

Most of options are closely binded to CI server of running environment.

#### CI server integration

There are two most important options for usage Dreed[[13](../README.md/#Dredd)] on CI server. These are `--reporter, -r` and `--output, -o`. The first one specifies format of the output of Dredd so it can be used by CI server or other tool used for evaluation of test results. Dredd currently (27<sup>th</sup> April 2014) supports 5 reporters

- junit,
- nyan,
- dot,
- markdown and
- html.

The second mentioned option is used for specification of path to which the reporter should save its output. It is possible to setup more reporters. Each reporter can have its own path to save the output.

Another useful option is `--inline-errors, -e` which determines whether some error or failure will be visible at time they occure or at the end of all tests. However this option is mostly useful for local testing and debugging because there is no need to wait for all tests but it can be stopped when error occures.

Option `--details, -d` can be used also for debugging if it is needed to see which details are in request or response. The option affects only passing tests because failed tests always shows it.

It can be useful sometimes to have more information about failed test. For this purpose there is the option `--level, -l` which specifies how detailed will be the output in console. The default one is "info". However "debug" level can be used for debugging. CI server can use "error" level because there is not usually need of detailed output on the server.

#### Validations

I did not mention a way how Dredd validates expectations and real requests and responses. Apiary[[20](../README.md/#Apiary)] created a tool named Gavel[[16](../README.md/#Gavel)] for this purpose.

Gavel undestands well to HTTP[[14](../README.md/#HTTP)] and _RESTful API_s. So it does assertions according to specifications of these technologies. All conditions of assertions are described in the documentation[[16](../README.md/#Gavel)].

The easiest validations are used for status code, headers and text example body. Status code and example body must match exactly to be valid. Headers are a JavaScript object in which expected header key can not be omitted and the value of the header must match exactly.

There are also validations for JSON example and for JSON schema[[3](../README.md/#JSONSchema)]. The JSON example validation will not set an error if there are all JSON keys and values matches exactly. Arrays in JSON must match count of items to be at least the same as expected and its values must match exactly. If value is an array of JSON then the rule is used recursively.

The JSON schema validation uses library Amanda[[18](../README.md/#Amanda)] which looks powerful for me. I did not go deep to find all its possibilities because it is out of bounds of this thesis. However it supports most of basics defined in general JSON schema[[3](../README.md/#JSONSchema)].

Based on these knowledge I decide to implement scenario testing for API Blueprint[[36](../README.md/#APIBlueprint)] and I wanted to use Dredd[[13](../README.md/#Dredd)] as primary testing tool. Next chapter is focused on the process of development of scenario testing and all my thoughts.
