# frozen_string_literal: true

require 'dotenv'
require 'active_record'
require 'telegram/bot'

Dotenv.load

ActiveRecord::Base.establish_connection(
  adapter: 'postgresql',
  encoding: 'unicode',
  database: ENV['DB_NAME'],
  pool: 5,
  username: ENV['DB_USER'],
  password: ENV['DB_PASSWORD']
)

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
