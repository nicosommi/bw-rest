BW-REST
--------------------------------------------------------------------
License information
Copyright BW-REST

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
---------------------------------------------------------------------

Advice: it is highly recommended that you see the webcast to learn how to use BW-REST, this are just rudimentary instructions

Installation
- Create Alias with lib folder placed at BW-REST/REST/JADE/Resources/lib
- Build library placed at BW-REST/Build
- Create an alias of that library
- Link your project with the generated .projlib
- (optional) replace variables to user the default router (w def http connection) or crear your own route process (1)
- (optional) create you own router.xml
- (optional) create your process handlers

(1) Create your own route process
- Create a process definition
- Put an HTTP receiver at your decision, but make sure to shape it like the default in BW-REST/REST/router.process
(Do not forget, for example, to add the cookie header)
- If you want to load a router.xml use the REST/GetDefaultRoutes.process and set the variable REST/routerPath to your route.xml
- Now call REST/RestProcessor.process, map it like the REST/route.process
- Finally, put a Send HTTP Response activity to the Http Receiver, and map it again, like REST/router.process

TIBCO Requirements
- BusinessWorks 5.10
- Designer 5.7.4.4
- JSON & REST Plugin 1.1 (to make a REST/JSON webapp)

