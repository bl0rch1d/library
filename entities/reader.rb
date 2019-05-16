# frozen_string_literal: true

require_relative '../utils/validate'

class Reader
  include Validate

  attr_reader :name, :email, :city, :street, :house

  def initialize(name:, email:, city:, street:, house:)
    raise ArgumentError unless valid? name, email, city, street, house

    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  def to_s
    "#{name}, #{email}, #{city}, #{street}. #{house}"
  end
end
