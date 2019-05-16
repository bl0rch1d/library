# frozen_string_literal: true

require 'date'
require 'faker'

module FakeDataGenerator
  LIMIT = 20

  class << self
    def call
      {
        authors: authors,
        books: books,
        readers: readers,
        orders: orders
      }
    end

    private

    def authors
      @authors = Array.new(rand(5..LIMIT)) do
        Author.new(
          name: Faker::Name.name,
          bio: 'Author Bio'
        )
      end
    end

    def books
      @books = Array.new(rand(5..LIMIT)) do
        Book.new(
          title: Faker::Book.title,
          author: @authors.sample
        )
      end
    end

    def readers
      @readers = Array.new(rand(5..LIMIT)) do
        Reader.new(
          name: Faker::Name.name,
          email: Faker::Internet.email,
          city: Faker::Address.city,
          street: Faker::Address.street_name,
          house: Faker::Address.building_number
        )
      end
    end

    def orders
      Array.new(rand(5..LIMIT)) do
        Order.new(
          book: @books.sample,
          reader: @readers.sample,
          date: Date.today
        )
      end
    end
  end
end
