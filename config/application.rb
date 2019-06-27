require_relative 'boot'
require 'rails/all'
# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)
module SampleApp
  class Application < Rails::Application
<<<<<<< HEAD
	config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}')]
	config.i18n.available_locales = [:en, :vi]
  config.i18n.default_locale = :en


=======
>>>>>>> 513b2a0023fbc987a34e5e5c081a98d3568da410
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
