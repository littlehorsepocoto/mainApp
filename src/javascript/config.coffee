Backbone = require 'backbone'
LayoutManager = require 'backbone.layoutmanager'
router = require './router'
controllers= require './controllersConfig'
$ = require 'jquery'
templates=require('../templates/**/*.hbs', {mode: 'hash'})
mainTemplate = require '../templates/main'


router.setController controller for controller in controllers

main = new Backbone.Layout(
  el: '#main'
  template: mainTemplate)
main.$el.appendTo("#main")
main.render()
controller.main=main for controller in controllers


# requireDir = require 'require-dir'
#
# templates = requireDir('../templates/', {
#   recurse: true
# })




Backbone.Model::toJSON = ->
  json = _.clone(@attributes)
  for attr of json
    if json[attr] instanceof Backbone.Model or json[attr] instanceof Backbone.Collection
      json[attr] = json[attr].toJSON()
  json

# Trigger the initial route and enable HTML5 History API support, set the
# root folder to '/' by default.  Change in app.js.
Backbone.history.start
  pushState: true
  root: "/"
# All navigation that is relative should be passed through the navigate
# method, to be processed by the router. If the link has a `data-bypass`
# attribute, bypass the delegation completely.
$(document).on 'click', 'a:not([data-bypass])', (evt) ->
  # Get the absolute anchor href.
  href =
    prop: $(this).prop('href')
    attr: $(this).attr('href')
  # Get the absolute root.
  root = location.protocol + '//' + location.host + app.root
  # Ensure the root is part of the anchor href, meaning it's relative.
  if href.prop and href.prop.slice(0, root.length) == root
    # Stop the default event to ensure the link will not cause a page
    # refresh.
    evt.preventDefault()
    # `Backbone.history.navigate` is sufficient for all Routers and will
    # trigger the correct events. The Router's internal `navigate` method
    # calls this anyways.  The fragment is sliced from the root.
    Backbone.history.navigate href.attr, true
  return


app =
  root: '/adm'
  router:router,
  main:main

Backbone.Layout.configure({
  manage: true
  prefix: 'app/templates/'
  fetchTemplate: (path) ->
    window.console.log path
    templates.path
})

LayoutManager.configure
  manage: true
  prefix: 'app/templates/'
  fetchTemplate: (path) ->
    window.console.log path
    templates.path

# The application layout handles link hijacking and can be modified to
# handle other application global actions as well.
app.layout = new Backbone.View(
  el: 'main'
  events: 'click a[href]:not([data-bypass])': 'hijackLinks'
  hijackLinks: (ev) ->
    # Get the absolute anchor href.
    href =
      prop: $(this).prop('href')
      attr: $(this).attr('href')
    # Get the absolute root.
    root = location.protocol + '//' + location.host + app.root
    # Ensure the root is part of the anchor href, meaning it's
    # relative.
    if href.prop.slice(0, root.length) == root
      # Stop the default event to ensure the link will not cause a
      # page
      # refresh.
      ev.preventDefault()
      # `Backbone.history.navigate` is sufficient for all Routers and
      # will
      # trigger the correct events. The Router's internal `navigate`
      # method
      # calls this anyways. The fragment is sliced from the root.
      Backbone.history.navigate href.attr, true
    return
)

module.exports=app
