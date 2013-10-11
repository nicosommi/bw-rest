@app = window ? {}

class Admin extends Backbone.Model
    defaults: ->
        {username: '', password: ''}
        
    login: ->
        console.log "Admin.login with: " + @get('username') + '/' + @get('password')
        obj = @
        $.get("http://localhost:8989/login",
            {username: @get('username'), password: @get('password')},
            'json'
        )
        .done( (data) ->
            console.log "login success"
            obj.trigger 'login'
        )
        .fail( (error) ->
            console.log "login failed"
            obj.trigger 'error'
        )

app.Admin = new Admin()

class User extends Backbone.Model
    defaults: ->
        {firstName: '', lastName: '',
        id: null}
        
    addUser: ->
        obj = @
        @save({},
        {
            success: (data) ->
                console.log "received: " + data
                obj.set 'id', data.get('User').id
            error: (error) ->
                console.log "error add user"
        })
    removeUser: ->
        console.log "User.removeUser: " + @get('id')
        obj = @
        @destroy({},
        {
            success: (data) ->
                console.log "remove success"
                obj.collection.remove obj
        })

app.User = User
