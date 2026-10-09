module.exports = (bot) -> 

  bot.hear /test/i, (res) ->
    res.send "Hello World!"