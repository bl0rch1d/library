# frozen_string_literal: true

require_relative '../utils/validate'

class Order
  include Validate

  attr_reader :book, :reader, :date

  def initialize(book:, reader:, date:)
    validate book, reader, date

    @book = book
    @reader = reader
    @date = date
  end

  def to_s
    "#{book}, #{reader}, #{date}"
  end

  private

  def validate(book, reader, date)
    check_class book, Book
    check_class reader, Reader
    check_class date, Date
  end
end
