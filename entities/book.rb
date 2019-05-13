# frozen_string_literal: true

# Creates object which represents a book
class Book
  attr_accessor :title, :author

  def initialize(title:, author:)
    raise ArgumentError unless valid? title, author

    @title = title
    @author = author
  end

  def to_s
    "#{@title}, #{@author}"
  end

  private

  def valid?(title, author)
    title.instance_of?(String) && !title.empty? && author.instance_of?(Author)
  end
end
