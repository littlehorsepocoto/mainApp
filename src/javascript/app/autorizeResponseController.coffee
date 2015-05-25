View = require  '../app/views/loggedView'

Controller = require '../Controller'

class MainController extends Controller
  initializeView: (message) ->
    window.console.log(message)
    view = new View
    
    @main.insertView("#content",view).render()
    window.console.log('logged ')
    return


module.exports= MainController
