class Author
  attr_accessor :name, :bio

  def initialize(name, bio)
    @name = name
    @bio = bio
  end

  def to_s
    @name
  end
end
