# frozen_string_literal: true

require 'yaml'
require 'pathname'

require_relative './entities/author'
require_relative './entities/book'
require_relative './entities/reader'
require_relative './entities/order'

require_relative './utils/db'
require_relative './utils/statistics'
require_relative './utils/fake_data_generator'
