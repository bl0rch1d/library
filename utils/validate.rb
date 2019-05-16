# frozen_string_literal: true

require_relative 'errors'

module Validate
  include Errors

  private

  def valid?(*props)
    props.all? do |prop|
      check_class(prop, String)

      !prop.empty?
    end
  end

  def book_valid?(title, author)
    check_class(title, String)
    check_class(author, Author)

    !title.empty?
  end

  def order_valid?(book, reader, date)
    check_class(book, Book)
    check_class(reader, Reader)
    check_class(date, Date)

    true
  end

  def check_class(instance, klass)
    raise WrongClassError unless instance.instance_of? klass
  end
end
