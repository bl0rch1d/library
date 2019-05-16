# frozen_string_literal: true

require_relative 'errors'

module Validate
  include Errors

  private

  def check_class(prop, klass)
    raise WrongClassError unless prop.instance_of? klass
  end

  def check_emptiness(prop)
    raise EmptyStringError if prop.empty?
  end
end
