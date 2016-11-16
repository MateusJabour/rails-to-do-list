reporters = Minitest.reporter.reporters
reporters.clear

require 'minitest/utils'
require 'minitest/utils/rails'
require 'minitest/utils/rails/locale'
require 'minitest/autorun'
