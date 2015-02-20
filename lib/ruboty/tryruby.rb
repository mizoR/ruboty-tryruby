require "ruboty/tryruby/version"
require "net/http"
require "json"

module Ruboty
  module Tryruby
    def self.execute(command)
      http = Net::HTTP.new('tryruby.org', 80)
      request = Net::HTTP::Put.new('/levels/1/challenges/0')
      request.set_form_data(cmd: command)
      response = http.request(request)
      code = response.code.to_i

      if (code >= 200) && (code <= 299)
        Result.parse(response.body)
      else
        raise response.value
      end
    end

    class Result
      def self.parse(raw_data)
        data = JSON.parse(raw_data)
        new(data)
      end

      def successful?
        success
      end

      def method_missing(method_name)
        method_name = method_name.to_s
        @data.key?(method_name) ? @data[method_name] : super
      end

      private

      def initialize(data)
        @data = data
      end
    end
  end
end
