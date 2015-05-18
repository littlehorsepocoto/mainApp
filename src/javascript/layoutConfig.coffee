Backbone = require 'backbone'
LayoutManager = require 'backbone.layoutmanager'
templates=require('../templates/**/*.hbs', {mode: 'hash'})
mainTemplate = require '../templates/main'
controllers = require './controllersConfig'

Backbone.Layout.configure({
  manage: true
  prefix: ''
  fetchTemplate: (path) ->
    templates[path+'.hbs']
} )

main = new Backbone.Layout(
  el: '#main'
  template: mainTemplate)
main.$el.appendTo("#main")
main.render()
controller.main=main for controller in controllers

module.exports=main
