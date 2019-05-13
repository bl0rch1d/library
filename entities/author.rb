# frozen_string_literal: true

# Creates object which represents a book author
class Author
  attr_accessor :name, :bio

  def initialize(name:, bio:)
    raise ArgumentError unless valid? name, bio

    @name = name
    @bio = bio
  end

  def to_s
    @name
  end

  private

  def valid?(*props)
    props.all? { |prop| prop.instance_of?(String) && !prop.empty? }
  end
end
