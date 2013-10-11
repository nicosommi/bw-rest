v0.1
-----
- support for static resources (lower priority than rest api)
    approach: si se define un metodo especifico con regex,
        toma ese, si no hubo ninguno entonces mira el static
- support for content-types
- support addition of extra headers
- config allow remote headers
- customizable via variables (COC approach)
- rule defined: auto parse from/to JSON is not responsibility of the rest server
- rule defined: templating is not responsibility of the rest server, however maybe a helper pallette is a nth
- schemas in separated schema files
- match routes
- support command parameters
- support querystring parameters
- support basic wildcars in http verb/method
