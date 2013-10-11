require.config
    paths:
        "jquery": "jquery-1.10.1.min"
        "jquery-ui": "jquery-ui-1.10.3.custom.min"
        "backbone": "backbone"
        "underscore": "lodash.min"
        "router": "router"
        "model": "model"
        "collection": "collection"
        "view": "view"
        "util": "util"
    shim:
        "backbone":
            "deps": ["jquery", "underscore"]
            "exports": "Backbone"
        "underscore":
            "deps": ["jquery"]
        "jquery":
            "exports": "$"
        "jquery-ui":
            "deps": ["jquery"]
        "router":
            "deps": ["view"]
        "model":
            "deps": ["backbone", "util"]
        "collection":
            "deps": ["model"]
        "view":
            "deps": ["collection"]

require ["jquery", "jquery-ui", "backbone", "router"], ($, jquery_ui, Backbone, router) ->
    $(document).ready(->
        Backbone.history.start()
    )
