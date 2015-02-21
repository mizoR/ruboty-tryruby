require "ruboty/tryruby/version"
require "ruboty/tryruby/result"
require "ruboty/handlers/tryruby"
require "net/http"
require "json"

module Ruboty
  module Tryruby
    def self.evaluate(command)
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
  end
end
