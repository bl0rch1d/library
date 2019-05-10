class Order
  attr_accessor :book, :reader, :date

  def initialize(book, reader, date)
    @book = book
    @reader = reader
    @date = date
  end

  def to_s
    "#{@book}, #{@reader}, #{@date}"
  end
end
