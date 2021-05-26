module Cinch
  module Plugins
    class Wit
      include Cinch::Plugin

      require 'wit'

      # Match when the bot's name is mentioned at the START.
      #   e.g. "Bot, how are you?"
      match lambda { |msg| /\A\s*#{msg.bot.nick}[:,](.+)/i }, use_prefix: false

      # Match when the bot's name is mentioned at the END.
      #   e.g. "Hello, Bot."
      match lambda { |msg| /(.+),\s+#{msg.bot.nick}[.?!\s]*\s*\Z/i }, use_prefix: false

      # Send a message to the Wit API and dispatch an event with the outcome.
      def execute(msg, message)
        wit_response = wit_client.message(message.strip)
        outcome = wit_response['outcome']
        debug outcome.to_s
        msg.bot.handlers.dispatch :intent, msg, outcome
      end

      private

      def wit_client
        @wit_client ||= ::Wit::Client.new(config[:access_token])
      end
    end
  end
end
