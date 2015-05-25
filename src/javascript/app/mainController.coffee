
DefaultView = require  '../app/views/defaultView'

Controller = require '../Controller'

class MainController extends Controller
  initializeView: ->
    defaultView = new DefaultView
    
    @main.insertView("#content",defaultView).render()
    
    return


module.exports=MainController
