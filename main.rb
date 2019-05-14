# frozen_string_literal: true

require_relative 'entities/library'

lib = Library.new

# --- Generate random data using Faker gem ---
# lib.data :generate

# --- Save existing data for each entity to db/ ---
# lib.data :save

# --- Load data from db/ ---
if Pathname.new(Config::DB_PATH + Config::DB_FILE).exist?
  lib.data :load
else
  lib.data :generate
end

# --- Wipe all data from db/ ---
# lib.data :delete

# --- library statistics ---
# 1. Top Reader
# 2. Most Popular Books
# 3. Number of Readers of the Most Popular Books
lib.statistics
