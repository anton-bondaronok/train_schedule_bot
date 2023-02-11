# frozen_string_literal: true

require './lib/controllers/base'

module Controllers
  class Commands < Controllers::Base
    def handle # rubocop:disable Metrics/AbcSize
      case message.text
      when '/start'
        bot.api.send_message(chat_id: message.chat.id, text: "Hello, #{tg_user.first_name}")
      when '/stop'
        bot.api.send_message(chat_id: message.chat.id, text: "Bye, #{tg_user.first_name}")
      end
    end
  end
end
