module Ruboty
  module Handlers
    class Tryruby < Base
      on %r<(ruby|rb|irb)\s+(.*)$>, name: 'evaluate', description: 'Evaluate one line of Ruby script'

      def evaluate(message)
        Ruboty::Actions::Tryruby.new(message).call
      rescue Exception => e
        Ruboty.logger.info "#{e.class}: #{e.message}"
      end
    end
  end
end
