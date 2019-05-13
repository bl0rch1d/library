# frozen_string_literal: true

# Contain methods which helps to build Library statistics
module Statistics
  def show
    puts <<-EOS
      ============================= Library statistics ==============================
        Top Reader: #{get_top_reader}
        Most Popular Book: #{get_top_books}
        Number of Readers of the Most Popular Books: #{get_readers_of_popular_books}
      ===============================================================================
    EOS
  end

  def get_top_reader(quantity: 1)
    get_top quantity, :reader
  end

  def get_top_books(quantity: 1)
    get_top quantity, :book
  end

  def get_readers_of_popular_books(quantity: 3)
    books = get_top quantity, :book

    @orders
      .select { |order| books.include? order.book }
      .uniq(&:reader)
      .size
  end

  private

  def get_top(quantity, entity_name)
    res = @orders
          .group_by(&entity_name)
          .max_by(quantity) { |_entity, orders| orders.size }
          .map(&:first)

    quantity == 1 ? res.first : res
  end
end
