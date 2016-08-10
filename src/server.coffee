express = require('express')
app = express()

port = process.env.PORT || 3000

app.get '/', (req, res) ->
  res.send "Piola"

app.listen port, ->
  console.log "Listen port #{port}"
