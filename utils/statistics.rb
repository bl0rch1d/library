module Statistics
  def get_top_reader
    get_top 1, :reader
  end

  def get_top_books
    get_top 1, :book
  end

  def get_readers_of_popular_books
    books = get_top 3, :book

    @orders
      .select { |order| books.include? order.book }
      .uniq(&:reader)
      .size
  end


  private

  def get_top(num, entity)
    res = @orders
          .group_by(&entity)
          .max_by(num) { |_, x| x.size }
          .map(&:first)

    num == 1 ? res.first : res
  end
end
