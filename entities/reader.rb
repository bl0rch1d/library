# frozen_string_literal: true

require_relative '../utils/validate'

class Reader
  include Validate

  attr_reader :name, :email, :city, :street, :house

  def initialize(name:, email:, city:, street:, house:)
    validate name, email, city, street, house

    @name = name
    @email = email
    @city = city
    @street = street
    @house = house
  end

  def to_s
    "#{name}, #{email}, #{city}, #{street}. #{house}"
  end

  private

  def validate(*props)
    props.each(&method(:check_emptiness))
  end
end
