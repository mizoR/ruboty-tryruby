require "json"

module Ruboty
  module Tryruby
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
