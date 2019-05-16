# frozen_string_literal: true

module Validate
  def valid?(*props)
    props.all? { |prop| prop.instance_of?(String) && !prop.empty? }
  end

  def book_valid?(title, author)
    title.instance_of?(String) && !title.empty? && author.instance_of?(Author)
  end

  def order_valid?(book, reader, date)
    book.instance_of?(Book) && \
      reader.instance_of?(Reader) && \
      date.instance_of?(Date)
  end
end
