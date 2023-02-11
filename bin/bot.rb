# frozen_string_literal: true

Dir['./config/initializers/*.rb'].sort.each { |file| require file }

require 'telegram/bot'
require './lib/core'

Telegram::Bot::Client.run(ENV['TELEGRAM_API_TOKEN']) do |bot|
  Core.process(bot)
end
