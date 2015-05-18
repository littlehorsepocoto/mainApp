Backbone = require 'backbone'
LayoutManager = require 'backbone.layoutmanager'


routeFunction = (controllerName, params...) ->
  if controllerName.indexOf('?') > -1
    controllerName = controllerName.split('?')[0]
  controller = @controllers[controllerName]
  if controller?
    controller.initializeView.apply controller, params
  return

# Defining the application router, you can attach sub routers here.
Router = Backbone.Router.extend(
  routes:
    '': 'index'
    '/': 'index'
  controllers: {}
  setController: (controller) ->
    @controllers[controller.route] = controller
    return
  initialize: (options) ->
    @routeFunction = routeFunction
    @route ':controllerName', 'routeFunction'
    @route ':controllerName/:param', 'routeFunction'
    @route ':controllerName/:param/:param2', 'routeFunction'

    return
  index: ->

    #@navigate 'index', trigger: true
    return
)
# Define your master router on the application namespace and trigger all
# navigation from this instance.
module.exports= new Router
