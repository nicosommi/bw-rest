@app = window ? {}
class Util
    initializeControls: ->
        console.log "Util.initializeControls"
        $('input').addClass("ui-corner-all")
        $("input[type='button'], a, button")
        .button()
        .click((event) ->
            event.preventDefault()
        )
        $('.icon-close-buttons')
        .button({
            icons: {
                primary: 'ui-icon-close'
            }
            text: false
        })
        .click((event) ->
            event.preventDefault()
        )
        $('.icon-edit-buttons')
        .button({
            icons: {
                primary: 'ui-icon-document-b'
            }
            text: false
        })
        .click((event) ->
            event.preventDefault()
        )
app.Util = new Util()
