# frozen_string_literal: true

require_relative '../utils/validate'

class Author
  include Validate

  attr_reader :name, :bio

  def initialize(name:, bio:)
    raise ArgumentError unless valid? name, bio

    @name = name
    @bio = bio
  end

  def to_s
    name
  end
end
