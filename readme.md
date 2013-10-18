BW-REST
=======

Introduction
------------
BW-REST is a REST webserver with HTML resources support and many additional features. For give you an idea, with BW-REST you can develop an entire modern web application using backbone, jquery, coffescript, require js, etc (as you can see on the example). JADE Templating is supported for view processing. Static resources are supported... and a lot more! Its for example useful when you need a little webapp to manage some entities, or when your team is composed of just TIBCO Designer developers.

Getting started
---------------
* Read the Big picture how to
* See the video
* Constantly view the example code

Big picture how to: use (See the video)
---------------------------------------
* compile the library from the sources or directly pick the bin folder from here
* add two file aliases: one for the previously obtained projlib and one for the lib folder
* add a reference to the projlib from your project
* customize the variables
* build your routes.xml
* (optionally) build you own extra servers on the same project
* prepare your controllers
* run and test it
* build your EAR!

Detailed steps
--------------
* Create Alias with lib folder placed at BW-REST/REST/JADE/Resources/lib
* Build library placed at BW-REST/Build
* Create an alias of that library
* Link your project with the generated .projlib
* (optional) replace variables to user the default router (w def http connection) or crear your own route process (1)
* (optional) create you own router.xml
* (optional) create your process handlers

(1) Create your own route process
* Create a process definition
* Put an HTTP receiver at your decision, but make sure to shape it like the default in BW-REST/REST/router.process
(Do not forget, for example, to add the cookie header)
* If you want to load a router.xml use the REST/GetDefaultRoutes.process and set the variable REST/routerPath to your route.xml
* Now call REST/RestProcessor.process, map it like the REST/route.process
* Finally, put a Send HTTP Response activity to the Http Receiver, and map it again, like REST/router.process

Requirements
------------
* BusinessWorks 5.10
* Designer 5.7.4.4
* JSON & REST Plugin 1.1 (to make a REST/JSON webapp)

Version history
---------------
v0.1
* support for multiple servers on the same project and archive
* support for view route type (jade with jade4j)
* support for cookies
* support for static resources
* support for content-types
* built in default implementation
* support addition of extra headers
* config allow remote headers (cross domain)
* customizable via variables
* schemas in separated schema files
* strategy pattern
* support command parameters
* support querystring parameters
* support basic wildcars in http verb/method

