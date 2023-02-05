# frozen_string_literal: true

require './lib/models/user'

module Controllers
  class Base
    def self.handle(message, bot)
      new(message, bot).handle
    end

    def initialize(message, bot)
      @message = message
      @bot = bot
    end

    def handle
      raise NotImplementedError
    end

    private

    attr_reader :message, :bot

    def tg_user
      @tg_user ||= message.from
    end

    def db_user
      @db_user ||= User.first_or_create(uid: tg_user.id)
    end
  end
end
