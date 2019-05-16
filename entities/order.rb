# frozen_string_literal: true

require_relative '../utils/validate'

class Order
  include Validate

  attr_reader :book, :reader, :date

  def initialize(book:, reader:, date:)
    raise ArgumentError unless order_valid? book, reader, date

    @book = book
    @reader = reader
    @date = date
  end

  def to_s
    "#{book}, #{reader}, #{date}"
  end
end
