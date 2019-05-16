# frozen_string_literal: true

module Database
  DB_PATH = './db/'
  DB_FILE = 'db.yaml'

  def data(action)
    unless private_methods.include? :"#{action}_data"
      raise ArgumentError, 'Invalid action'
    end

    Dir.mkdir(DB_PATH, 0o700) unless Pathname.new(DB_PATH).exist?

    send :"#{action}_data"
  end

  private

  def save_data
    data = {
      authors: @authors,
      books: @books,
      orders: @orders,
      readers: @readers
    }

    File.write(Config::DB_PATH + Config::DB_FILE, data.to_yaml)
  end

  def load_data
    file = DB_PATH + DB_FILE
    path = Pathname.new(file).exist? ? file : './seed.yaml'

    yaml = File.read(path)
    data = Psych.safe_load(
      yaml, [Symbol, Date, Author, Book, Reader, Order], [], true
    )

    parse data
  end

  def generate_data
    data = FakeDataGenerator.call
    parse data
  end

  def delete_data
    file = DB_PATH + DB_FILE

    return unless Pathname.new(file).exist?

    File.delete(file)
  end

  def parse(data)
    @authors  = data[:authors]
    @books    = data[:books]
    @orders   = data[:orders]
    @readers  = data[:readers]
  end
end
