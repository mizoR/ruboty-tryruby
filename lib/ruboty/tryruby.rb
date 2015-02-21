require "ruboty/tryruby/version"
require "ruboty/tryruby/result"
require "ruboty/tryruby/evaluator"
require "ruboty/handlers/tryruby"

module Ruboty
  module Tryruby
    def self.evaluate(command)
      evaluator = Evaluator.new(command)
      evaluator.evaluate
    end
  end
end
