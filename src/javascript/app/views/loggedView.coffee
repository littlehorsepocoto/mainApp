Backbone = require 'backbone'
_ = require 'lodash'

DefaultView =  Backbone.View.extend(
  template: 'logged'

  serialize: ->
    this
  initialize: (@message)->
    _.bindAll this
    return
  afterRender:->


)
module.exports=DefaultView
