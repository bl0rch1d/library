# frozen_string_literal: true

require_relative '../autoload'

class Library
  include Statistics
  include Database

  def initialize(authors: [], books: [], readers: [], orders: [])
    @authors = authors
    @books = books
    @readers = readers
    @orders = orders
  end

  def add_entity(entity)
    case entity
    when Author  then @authors << entity
    when Book    then @books << entity
    when Order   then @orders << entity
    when Reader  then @readers << entity
    else
      raise ArgumentError
    end
  end

  def statistics
    show
  end
end
