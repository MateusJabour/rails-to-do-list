reporters = Minitest.reporter.reporters
reporters.clear

require 'minitest/utils'
require 'minitest/utils/rails'
require 'minitest/utils/rails/locale'
require 'minitest/autorun'

# Not working (??)
module ActionDispatch
  class IntegrationTest
    setup do
      I18n.locale = ENV.fetch('LOCALE', I18n.default_locale)
    end

    teardown do
      I18n.locale = I18n.default_locale
    end
  end
end
