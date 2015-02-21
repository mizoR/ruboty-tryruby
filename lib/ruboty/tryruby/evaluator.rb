require "net/http"

module Ruboty
  module Tryruby
    class Evaluator
      attr_reader :http, :request

      def initialize(command)
        @http = Net::HTTP.new('tryruby.org', 80)
        @request = Net::HTTP::Put.new('/levels/1/challenges/0')
        @request.set_form_data(cmd: command)
      end

      def evaluate
        response = http.request(request)
        parse(response)
      end

      private

      def parse(response)
        code = response.code.to_i

        if (code >= 200) && (code <= 299)
          Result.parse(response.body)
        else
          raise response.value
        end
      end
    end
  end
end
