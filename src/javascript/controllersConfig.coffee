MainController = require './app/mainController'
LoggedController = require './app/autorizeResponseController'
controllers=[new MainController('index'), new LoggedController('authorize'),]

module.exports=controllers
