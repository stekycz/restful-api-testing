## Installation and an example of usage

I would like to show some examples how to use the created tool. The easiest way how to start is installation of Cucumber[[6](../README.md/#Cucumber)].

```bash
npm install cucumber
```

Or it can be also installed globaly.

```bash
npm install -g cucumber
```

I will assume the created testing tool is already installed.

The next important step is to create directory for features. It should be placed in the root of a project because of easier usage. The name of direcotry is `features`.

```bash
mkdir features
```

Then it is possible to create first feature test. You can use whatever editor you want I choosed `nano` for example.

```bash
nano feature/example.feature
```

The following code is the same as in tests for the testing tool.

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

I did not mention the _Background_ section used in the Gherkin[[27](../README.md/#Gherkin)] code above. The _Background_ is used by all scenarios for the feature. It is good to use it to deduplicate steps in scenarios.

There is a feature test which contains two scenarios now. So it can be run.

```bash
cucumber.js -r ./path/to/step-definitions.coffee
```

If short call of `cucumber.js` does not work then it could be badly installed or use full path to the script. You should also use full path to step definitions file if it throws some errors. The file is currently required to be provided using the testing tool.

However it can be also passed in different way. Cucumber[[6](../README.md/#Cucumber)] loads automatically step definitions and the World from feature directory. So there can be created a file which will contain definition of classes which inherits from the World and step definitions provided by the testing tool. This is a way I personaly prefer because it is required in case of addition another custom step definitions. However it is not required for simple tests.

The output of the command above would be following on sucess.

```bash
...............

2 scenarios (2 passed)
15 steps (15 passed)
```

However there can be used some of other reportes which Cucumber[[6](../README.md/#Cucumber)] supports.
