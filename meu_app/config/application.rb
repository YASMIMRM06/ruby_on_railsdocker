require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module MeuApp
  class Application < Rails::Application
    # Certifique-se de que esta linha está presente
    config.assets.precompile = %w(application.css)
  end
end