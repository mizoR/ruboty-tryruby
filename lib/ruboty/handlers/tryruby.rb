module Ruboty
  module Handlers
    class Tryruby < Base
      on %r<(ruby|rb|irb)\s+(.*)$>, name: 'evaluate', description: 'Evaluate one line of Ruby script'

      def evaluate(message)
        script = message[2]
        result = Ruboty::Tryruby.execute(script)
        reply_message = result.successful? ? result.output : result.result
        message.reply(reply_message)
      rescue Exception => e
        Ruboty.logger.info "#{e.class}: #{e.message}"
      end
    end
  end
end
