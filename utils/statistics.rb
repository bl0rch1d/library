# frozen_string_literal: true

module Statistics
  def show
    puts <<-ENDOFSTRING
      ============================= Library statistics ==============================
        Top Reader: #{get_top_reader}
        Most Popular Book: #{get_top_books}
        Number of Readers of the Most Popular Books: #{get_readers_of_popular_books}
      ===============================================================================
    ENDOFSTRING
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
    result = @orders
             .group_by(&entity_name)
             .max_by(quantity) { |_entity, orders| orders.size }
             .map(&:first)

    quantity == 1 ? result.first : result
  end
end
