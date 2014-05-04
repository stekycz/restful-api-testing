## Conclusion

There are two parts which have been done during working on this thesis. There is analysis output which summarized knowledge about _RESTful API_ testing itself and exists tools. The second output is scenario based testing tool which has been implemented.

I have remided some basics related to regular software testing at the begining. I have been focused on testing methods, levels and types. I have remind these categories because it is good to know in my opinion. I have also described some testing process possibilities related to development process. I did all this work to find some differences and similarities to regular software testing. I have found a few of both - differences and similarities.

I have focused on _RESTful API_ description or testing tools next. I have described them and compared them by a few parameters. There is 6 tools I have descibed. The comparison was not simple because each tool has its own advantages and disadvantages. I have choosed one of them for usage in next parts of the thesis.

The choosen tool has been Dredd[[13](../README.md/#Dredd)] and API Blueprint[[36](../README.md/#APIBlueprint)]. I have focused on them in detail next. I have learn the syntax of API Blueprint and found some interesting parts of it. I have also learn to use Dredd. There is many possibilities of usage. I have also explored the code of Dredd to figure out how it works. All these information are very valuable for me.

The last part is focused on implementation of scenario based testing tool. I have sumarized some requirements I have expected by the tool. I have also consider a few implementation possibilities. Thinking about implementation possibilities I have met team from Apiary[[20](../README.md/#Apiary)] to discuss related themes. I have remember a lot of information there which are very valuable for me. I have decide to use Cucumber[[6](../README.md/#Cucumber)] as primary testing tool for _RESTful API_ scenario testing tool. At the end it was a good choice in my opinion. The tool is simple to use and there is a lot of features which I want to implement.

I have learned a lot during working on this thesis. I have tried some new technologies what can be useful for me in the future.

However the testing tool is not completely done in these day. There are some missing features which I plan to do. It is inheritance of default parameters, headers and bodies for requests from API Blueprint[[36](../README.md/#APIBlueprint)] file for example. I also want to provide validation against to JSON Schema[[3](../README.md/#JSONSchema)], validation of request and processing of parameters in URI templates.

The tool is available publicly on GitHub as **Cucumber 4 API Blueprint**[[37](../README.md/#Cucumber4APIBlueprint)] under MIT license[[38](../README.md/#MITlicense)].
