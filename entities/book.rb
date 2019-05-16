# frozen_string_literal: true

require_relative '../utils/validate'

class Book
  include Validate

  attr_reader :title, :author

  def initialize(title:, author:)
    validate title, author

    @title = title
    @author = author
  end

  def to_s
    "#{title}, #{author}"
  end

  private

  def validate(title, author)
    check_emptiness title
    check_class author, Author
  end
end
