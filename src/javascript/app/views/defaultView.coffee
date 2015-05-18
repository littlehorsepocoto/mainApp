Backbone = require 'backbone'
_ = require 'lodash'

DefaultView =  Backbone.View.extend(
  template: 'default'
  
  serialize: ->
    this
  initialize: ->
    _.bindAll this
    return


)
module.exports=DefaultView
