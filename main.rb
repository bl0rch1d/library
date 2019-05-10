require_relative 'entities/library'

lib = Library.new

# --- Add custom obj for each entity ---
lib.add_entity Author.new('name', 'bio'), :author
lib.add_entity Book.new('titme', Author.new('Book.author', 'book.bio')), :book
lib.add_entity Reader.new('1', '2', '3', '4', '5'), :reader
lib.add_entity Order.new(Book.new('Order.book', 'Order.author'), Author.new('name', 'bio'), Date.today), :order

# --- Generate random data using Faker gem ---
# lib.data :generate

# --- Save existing data for each entity to db/ ---
lib.data :save

# --- Load data from db/ ---
# lib.data :load

# --- Wipe all data from db/ ---
# lib.data :delete

# --- library statistics ---
# 1. Top Reader
# 2. Most Popular Books
# 3. Number of Readers of the Most Popular Books​
lib.statistics
