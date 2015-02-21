module Ruboty
  module Actions
    class Tryruby < Base
      def call
        message.reply(body)
      end

      private

      def script
        message[2]
      end

      def body
        result.successful? ? result.output : result.result
      end

      def result
        @result ||= Ruboty::Tryruby.evaluate(script)
      end
    end
  end
end
