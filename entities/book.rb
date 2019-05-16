# frozen_string_literal: true

require_relative '../utils/validate'

class Book
  include Validate

  attr_reader :title, :author

  def initialize(title:, author:)
    raise ArgumentError unless book_valid? title, author

    @title = title
    @author = author
  end

  def to_s
    "#{title}, #{author}"
  end
end
