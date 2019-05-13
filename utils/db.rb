# frozen_string_literal: true

# Contain methods for persistence functonality
module Database
  private

  # All the data of the library can be to stored/loaded into some storage (YML,JSON etc)
  def save_data
    data = {
      authors: @authors,
      books: @books,
      orders: @orders,
      readers: @readers
    }

    File.write(Config::DB_PATH, data.to_yaml)
  end

  # All the data of the library can be to stored/loaded into some storage (YML,JSON etc)
  def load_data
    data = YAML.load(File.read(Config::DB_PATH))

    @authors  = data[:authors]
    @books    = data[:books]
    @orders   = data[:orders]
    @readers  = data[:readers]
  end

  def for_entities
    Config::ENTITIES.each do |entity|
      yield entity
    end
  end

  # Generating random data using Faker gem
  def generate_data
    for_entities do |entity|
      instance_variable_set("@#{entity}s", FakeDataGenerator.method("#{entity}s").call)
    end
  end

  # Remove all saved data
  def delete_data
    for_entities do |entity|
      file = Config::DB_PATH + "#{entity}s.yaml"

      return unless Pathname.new(file).exist?

      File.delete(file)
    end
  end

end
