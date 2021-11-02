module.exports = (bot) -> 

  bot.hear /test/i, (res) ->
    res.send "Hello World!"

  jchangpass = "test"

  bot.respond /elliman passwords/i, (res) ->
    bot.logger.debug id
    res.send jchangpass