## Installation and an example of usage

At the end of implementation I would like to show some examples how to use the created tool. The easiest way how to start is installation of Cucumber[[6](../README.md/#Cucumber)].

```bash
npm install cucumber
```

Or it can be also installed globaly.

```bash
npm install -g cucumber
```

I will assume that the testing tool is already installed.

The next important step is to create directory for features. It should be placed in the root of a project because of easier usage. The name of direcotry is `features`.

```bash
mkdir features
```

Then it is possible to create first feature test.

```bash
$EDITOR feature/example.feature
```

Following code is the same as in tests for the testing tool.

```gherkin
Feature: Machines collection
    As an anonymous user
    I want to be able to access machine collection
    So that I can create a Machine and retrieve exists Machines

    Background:
        Given API Blueprint in file "test/fixtures/apiary.apib"
        And base url http://localhost:3333

    Scenario: Create a Machine
        When I do action Machines > Machines collection
          > Create a Machine
        And the request message header Accept is
          application/json
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
        When I do action Machines > Machines collection
          > Retrieve all Machines
        And the request message header Accept is
          application/json
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

```bash
cucumber.js -r ./path/to/step-definitions.coffee
```

If short call of `cucumber.js` dpes not work then it could be badly installed or use full path to the script. The same can be applied to step definitions file which is currently required to provide using the testing tool.

However it can be also passed in different way. Cucumber[[6](../README.md/#Cucumber)] loads automatically step definitions and the World from feature directory. So there can be created a file which will contain definition of classes which inherits from the World and step definitions provided by the testing tool. This is a way I personaly prefer because it is required for case of addition another custom step definitions. However it is not required for simple tests.

The output of the command above would be following on sucess.

```bash
...............

2 scenarios (2 passed)
15 steps (15 passed)
```

However there can be used some of other reportes which Cucumber[[6](../README.md/#Cucumber)] supports.

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
