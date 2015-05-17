Backbone = require 'Backbone'

DefaultView =  Backbone.View.extend(
  template: 'amenity/main'
  serialize: ->
    this
  initialize: ->
    _.bindAll this
    return
  afterRender: ->
    that = this
    @model.forEach (group) ->
      amenityGroupItemView = new AmenityGroupItemView(model: group)
      that.insertView('#groups', amenityGroupItemView).render()
      return
    return
)
module.exports=DefaultView
