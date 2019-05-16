# frozen_string_literal: true

module Errors
  class WrongClassError < StandardError
    def initialize
      super('Invalid class')
    end
  end
end
