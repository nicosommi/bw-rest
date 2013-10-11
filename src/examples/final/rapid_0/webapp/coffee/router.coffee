@app = window.app ? {}
jQuery ->
    class AppRouter extends Backbone.Router
        routes: ->
            '': 'login'
            'users': 'users'
        initialize: ->
            console.log "initialize router"
            @view = new app.AppView()
            @loginView = new app.AdminView {model: app.Admin}
            @usersView = new app.UsersView {collection: app.Users}
        login: ->
            console.log "AppRouter.login route executed..."
            @view.render(@loginView)
        users: ->
            console.log "AppRouter.users"
            @view.render(@usersView)
    app.AppRouter = new AppRouter()