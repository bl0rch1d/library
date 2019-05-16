# frozen_string_literal: true

require_relative 'entities/library'

lib = Library.new

# lib.data :generate
# lib.data :save
lib.data :load
# lib.data :delete
lib.statistics
