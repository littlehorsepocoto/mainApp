Backbone = require 'backbone'
LayoutManager = require 'backbone.layoutmanager'
router = require './router'
controllers= require './controllersConfig'



# requireDir = require 'require-dir'
#
# templates = requireDir('../templates/', {
#   recurse: true
# })

fs = require 'fs'
templates=require('../templates/**/*.hbs', {mode: 'hash'})
#this is possible on browserify thanks to https://github.com/substack/brfs



router.setController controller for controller in controllers

app =
  root: '/adm'
  router:router

LayoutManager.configure
  manage: true
  prefix: 'app/templates/'
  fetchTemplate: (path) ->
    window.console.log path
    templates.path

# The application layout handles link hijacking and can be modified to
# handle other application global actions as well.
app.layout = new (Backbone.View)(
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
