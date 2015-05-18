app = require './config'

authenticate= ->
  window.location.href = "https://www.strava.com/oauth/authorize?client_id=6139&redirect_uri=http://localhost:3000&scope=view_private&approval_prompt=auto&response_type=code"
