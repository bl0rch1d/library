# frozen_string_literal: true

require_relative '../utils/validate'

class Author
  include Validate

  attr_reader :name, :bio

  def initialize(name:, bio:)
    validate name, bio

    @name = name
    @bio = bio
  end

  def to_s
    name
  end

  private

  def validate(*props)
    props.each(&method(:check_emptiness))
  end
end
