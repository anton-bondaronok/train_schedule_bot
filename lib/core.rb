# frozen_string_literal: true

require './lib/controllers/commands'

class Core
  def self.process(bot)
    new(bot).process
  end

  def initialize(bot)
    @bot = bot
  end

  def process
    bot.listen do |message|
      controller.handle(message, bot)
    end
  end

  private

  attr_reader :bot

  def controller
    Controllers::Commands
  end
end
