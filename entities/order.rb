# frozen_string_literal: true

# Creates object which represents a store order
class Order
  attr_accessor :book, :reader, :date

  def initialize(book:, reader:, date:)
    raise ArgumentError unless valid? book, reader, date

    @book = book
    @reader = reader
    @date = date
  end

  def to_s
    "#{@book}, #{@reader}, #{@date}"
  end

  private

  def valid?(book, reader, date)
    book.instance_of?(Book) && reader.instance_of?(Reader) && date.instance_of?(Date)
  end
end
