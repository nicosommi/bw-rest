@app = window ? {}

jQuery ->
    class AppView extends Backbone.View
        el: $('#appView')
        initialize: ->
            _.bindAll @, 'render'
        render: (subview) ->
            console.log "AppView.render"
            subview.render()
            @
        change: (content) ->
            @$el.empty()
            @$el.append content
            app.Util.initializeControls()

    app.AppView = AppView
    
    class UserView extends Backbone.View
        tagName: 'div'
        id: 'userView'
        template: _.template $('#userTemplate').html()
        events: ->
            'keyup #inputFirstName': 'mapFields'
            'keyup #inputLastName': 'mapFields'
        initialize: ->
            _.bindAll @, 'render', 'show', 'hide', 'add', 'render', 'initializeControls', 'mapFields', 'setUser', 'renderChange'
            @listenTo @model, 'change', @renderChange
        mapFields: (e) ->
            console.log "mapFields"
            @model.set 'firstName', $('#inputFirstName').val()
            @model.set 'lastName', $('#inputLastName').val()
        show: ->
            console.log 'UserView.show'
            @$el.dialog 'open'
            @delegateEvents() #rebind events
        hide: ->
            console.log 'UserView.hide'
            @$el.dialog 'close'
        add: ->
            console.log 'UserView.add'
            @collection.addUser @model
            @setUser(new app.User())
            @hide()
        setUser: (model) ->
            console.log 'UserView.setUser'
            @model = model
            $('#inputFirstName').val @model.get('firstName')
            $('#inputLastName').val @model.get('lastName')
        renderChange: ->
            console.log 'UserView.renderChange'
            @render()
            @initializeControls()
        render: ->
            console.log 'UserView.render'
            @$el.html @template({})
            @
        initializeControls: ->
            console.log 'UserView.initializeControls'
            obj = @
            @$('#btnAddUser')
            .click( (event) ->
                obj.mapFields()
                app.AppRouter.usersView.addUser()
            )
    app.UserView = UserView

    class UserItemView extends Backbone.View
        tagName: 'li'
        className: 'userItem'
        initialize: ->
            _.bindAll @, 'render', 'initializeControls'
            @template = _.template $('#userItemTemplate').html()
        render: ->
            console.log "UserItemView.render"
            @$el.html @template({user: @model.attributes})
            @
        initializeControls: ->
            console.log "UserItemView.initializeControls"
            obj = @
            @$('#btnRemoveUser')
            .click( (event) ->
                app.AppRouter.usersView.removeUser obj.model
            )
            @$('#btnEditUser')
            .click( (event) ->
                app.AppRouter.usersView.openEditUser obj.model
            )
    
    app.UserItemView = UserItemView
    
    class UsersView extends Backbone.View
        id: 'usersView'
        tagName: 'div'
        
        initialize: ->
            _.bindAll @, 'render', 'initializeControls', 'openAddUser', 'addUser', 'removeUser'
            @template = _.template $('#usersTemplate').html()
            @listenTo @collection, 'sync', @render
            @listenTo @collection, 'add', @render
            @listenTo @collection, 'remove', @render
            @addUserView = new app.UserView({model: new app.User(), collection: @collection})
        openAddUser: ->
            console.log "UsersView.openAddUser"
            @addUserView.setUser(new app.User())
            @addUserView.show()
        openEditUser: (model) ->
            console.log "UsersView.openEditUser"
            @addUserView.setUser model
            @addUserView.show()
        addUser: () ->
            console.log "UsersView.addUser"
            @addUserView.add()
        removeUser: (model) ->
            console.log "UsersView.removeUser: " + model.get('firstName')
            @collection.removeUser model
        render: ->
            console.log "UsersView.render"
            #render this list
            @$el.html @template({})
            container = @$('ul')
            #for each item on collection, render and append it to the list
            views = []
            @collection.each( (item) ->
                console.log "render user item"
                view = new app.UserItemView {model: item, collection: @collection}
                views = _.union views, [view]
                container.append view.render().el
            , @)
            @$el.append @addUserView.render().el
            app.AppRouter.view.change @$el
            #initialize jquery ui controls
            @initializeControls(views)
            @
        initializeControls: (subviews) ->
            console.log "UsersView.initializeControls"
            @$('#userView').dialog({
                autoOpen: false
                modal: true
                show: {
                    effect: "blind"
                    duration: 300
                }
                hide: {
                    effect: "explode"
                    duration: 300
                }
            })
            @addUserView.initializeControls()
            (subview.initializeControls() for subview in subviews)

    app.UsersView = UsersView

    class AdminView extends Backbone.View
        tagName: 'div'
        id: 'adminView'
        events:
            'keyup #username': 'mapInputField'
            'keyup #password': 'mapInputField'
        initialize: ->
            _.bindAll @, 'render', 'hide', 'mapInputField', 'login', 'loggedIn', 'loginError'
            @template = _.template $('#loginTemplate').html()
            @listenTo @model, 'login', @loggedIn
            @listenTo @model, 'error', @loginError
        hide: ->
            console.log "AdminView.hide"
            @$el.hide()
        render: ->
            console.log "AdminView.render"
            @$el.html @template({})
            app.AppRouter.view.change @$el
            @
        mapInputField: () ->
            console.log "mapInputFields"
            @model.set 'username', $('#username').val()
            @model.set 'password', $('#password').val()
        login: (e) ->
            console.log 'AdminView.login'
            @mapInputField()
            @model.login e
            $('#loginErrorMessage').hide()
        loggedIn: ->
            console.log 'AdminView.loggedin'
            Backbone.history.navigate '#users', {trigger: true}
            app.Users.fetch {reset: true}
            $('#loginErrorMessage').hide()
        loginError: ->
            console.log 'AdminView.loginError'
            $('#loginErrorMessage').show()

    app.AdminView = AdminView
