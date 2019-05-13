# frozen_string_literal: true

require_relative 'entities/library'

lib = Library.new

lib.add_entity(Author.new(name: "Name", bio: "Bio"))

# --- Generate random data using Faker gem ---
lib.data :generate

# --- Save existing data for each entity to db/ ---
lib.data :save

# --- Load data from db/ ---
# lib.data :load

# --- Wipe all data from db/ ---
# lib.data :delete

# --- library statistics ---
# 1. Top Reader
# 2. Most Popular Books
# 3. Number of Readers of the Most Popular Books
lib.statistics


