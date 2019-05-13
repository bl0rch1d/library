# frozen_string_literal: true

require_relative '../autoload'

# Creates object which represents Library
# Helps manage the basic needs of Library
class Library
  include Statistics
  include Database

  attr_accessor :authors, :readers, :books, :orders

  def initialize(authors = [], books = [], readers = [], orders = [])
    @authors = authors
    @books = books
    @readers = readers
    @orders = orders
  end

  # Library app must have an ability to add each of the entity to itself
  def add_entity(entity)
    case entity
    when Author  then @authors << entity
    when Book    then @books << entity
    when Order   then @orders << entity
    when Reader  then @readers << entity
    else
      raise ArgumentError
    end

    data :save
  end

  # Library must have the ability to show some custom statistics about the library processes
  def statistics
    show
  end

  # Library app must be persisted, that’s why we must have the ability to store/load data from the library.
  # save/load/generate/delete actions are available
  def data(action)
    raise ArgumentError, 'Invalid action' unless private_methods.include? :"#{action}_data"

    Dir.mkdir(Config::DB_PATH, 0o700) unless Pathname.new(Config::DB_PATH).exist?

    send :"#{action}_data"
  end
end
