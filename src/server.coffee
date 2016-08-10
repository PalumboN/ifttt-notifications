bodyParser = require('body-parser')
express = require('express')
app = express()
rp = require('request-promise')

port = process.env.PORT || 3000
makerToken = process.env.MAKER_TOKEN

app.use(bodyParser.json())

app.get '/', (req, res) ->
  res.send "Piola"

app.post '/messages', (req, res) ->
  messages.push req.body.text
  res.end()

app.post '/notification', (req, res) ->
  rp(iftttNotification)
  .then (response) -> res.send response
  .catch ({statusCode, message}) -> res.status(statusCode).send message

app.post '/clean', (req, res) ->
  messages.length = 0
  res.end()


app.listen port, ->
  console.log "Listen port #{port}"

messages = []

iftttNotification = {
  method: 'POST'
  uri: "https://maker.ifttt.com/trigger/notification/with/key/#{makerToken}"
  body:
    value1: messages
  json: true
};
