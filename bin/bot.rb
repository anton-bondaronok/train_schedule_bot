# frozen_string_literal: true

Dir['./config/initializers/*.rb'].each { |file| require file }





require "telegram/bot"
require './lib/core'

Telegram::Bot::Client.run(ENV.fetch('TELEGRAM_API_TOKEN', nil)) do |bot|
  Core.process(bot)
end
