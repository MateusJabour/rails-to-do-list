require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Taskv
  class Application < Rails::Application
    config.i18n.available_locales = %w[en pt-BR]
    config.i18n.default_locale = 'en'
    config.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.yml').to_s]
  end
end
