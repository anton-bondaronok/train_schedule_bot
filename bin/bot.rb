# frozen_string_literal: true

require 'dotenv'
require 'telegram/bot'

Dotenv.load

Telegram::Bot::Client.run(ENV['TELEGRAM_API_TOKEN']) do |bot|
  bot.listen do |message|
    case message.text
    when '/start'
      bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{message.from.first_name} !")
    when '/stop'
      bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{message.from.first_name}")
    end
  end
end