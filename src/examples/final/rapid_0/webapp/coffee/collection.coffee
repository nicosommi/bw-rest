@app = window ? {}

class Users extends Backbone.Collection
    model: app.User
    url: ->
        'http://localhost:8989/users'
        
    parse: (response) ->
        console.log "Users.parse"
        _.map response["Users"]["User"], (item) ->
            {"id": item["id"],
            "firstName": item["firstName"],
            "lastName": item["lastName"]}
    
    addUser: (model) ->
        console.log "Users.addUser"
        @add model
        model.addUser()
    removeUser: (model) ->
        console.log "Users.removeUser"
        model.removeUser()

app.Users = new Users()
