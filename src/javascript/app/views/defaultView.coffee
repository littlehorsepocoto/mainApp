Backbone = require 'backbone'
_ = require 'lodash'

DefaultView =  Backbone.View.extend(
  template: 'default'

  serialize: ->
    this
  initialize: ->
    _.bindAll this
    return
  afterRender:->
    @.$('#stravaLogin').click -> window.location.href = "https://www.strava.com/oauth/authorize?client_id=6139&redirect_uri=http://localhost:3000&scope=view_private&approval_prompt=auto&response_type=code"





)
module.exports=DefaultView
