require 'yaml'
require 'pathname'

require_relative "author"
require_relative "book"
require_relative "reader"
require_relative "order"

require_relative "../utils/statistics"
require_relative "../utils/fake_data_generator"
require_relative "../config"


class Library
  include Statistics

  attr_accessor :authors, :readers, :books, :orders

  def initialize(authors = [], books = [], readers = [], orders = [])
    @authors = authors
    @books = books
    @readers = readers
    @orders = orders
  end

  # Library app must have an ability to add each of the entity to itself
  def add_entity(entity, name)
    raise ArgumentError unless Config::ENTITIES.include? name.to_sym

    instance_variable_get("@#{name}s") << entity

    data :save
  end

  # Library must have the ability to show some custom statistics about the library processes
  def statistics
    puts <<-EOS
      ============================= Library statistics ==============================
        Top Reader: #{get_top_reader}
        Most Popular Book: #{get_top_books}
        Number of Readers of the Most Popular Books: #{get_readers_of_popular_books}
      ===============================================================================
    EOS
  end

  # Library app must be persisted, that’s why we must have the ability to store/load data from the library.
  # save/load/generate/delete actions are available
  def data(action)
    raise ArgumentError, "Invalid action" unless private_methods.include? :"#{action}_data"

    Dir.mkdir(Config::DB_PATH, 0700) unless Pathname.new(Config::DB_PATH).exist?

    send :"#{action}_data"
  end


  private

  def for_entities
    Config::ENTITIES.each do |entity|
      yield entity
    end
  end

  # All the data of the library can be to stored/loaded into some storage (YML,JSON etc)
  def save_data
    for_entities do |entity|
      data = instance_variable_get("@#{entity}s").to_yaml
              
      File.write(Config::DB_PATH + "#{entity}s.yaml", data)
    end
  end

  # All the data of the library can be to stored/loaded into some storage (YML,JSON etc)
  def load_data
    for_entities do |entity|
      data = YAML.load(File.read(Config::DB_PATH + "#{entity}s.yaml"))
              
      instance_variable_set("@#{entity}s", data)
    end
  end

  def generate_data
    for_entities do |entity|
      instance_variable_set("@#{entity}s", FakeDataGenerator.method("#{entity}s").call)
    end
  end

  def delete_data
    for_entities do |entity|
      file = Config::DB_PATH + "#{entity}s.yaml"

      return unless Pathname.new(file).exist?

      File.delete(file)
    end
  end
end
