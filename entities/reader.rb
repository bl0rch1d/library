# frozen_string_literal: true

# Creates object which represents a Reader data for library database
class Reader
  attr_accessor :name, :email, :city, :street, :house

  def initialize(name:, email:, city:, street:, house:)
    raise ArgumentError unless valid? name, email, city, street, house

    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  def to_s
    "#{@name}, #{@email}, #{@city}, #{@street}. #{@house}"
  end

  private

  def valid?(*props)
    props.all? { |prop| prop.instance_of?(String) && !prop.empty? }
  end
end
