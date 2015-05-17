Backbone = require 'backbone'
LayoutManager = require 'backbone.layoutmanager'
mainTemplate = require '../templates/main'

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
  setController: (name, controller) ->
    @controllers[name] = controller
    return
  initialize: (options) ->
    main = new (Backbone.Layout)(
      el: '#main'
      template: mainTemplate)
    
    @routeFunction = routeFunction
    @route ':controllerName', 'routeFunction'
    @route ':controllerName/:param', 'routeFunction'
    @route ':controllerName/:param/:param2', 'routeFunction'

    return
  index: ->
    @navigate 'villas', trigger: true
    return
)
# Define your master router on the application namespace and trigger all
# navigation from this instance.
module.exports= new Router
