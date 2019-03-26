require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module CustomRails
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    

    def register_domain(name)
      app_path = "domains/#{name}"
      config.paths['app'] << app_path
      config.paths['app/assets'] << "#{app_path}/assets"
      config.paths['app/controllers'] << "#{app_path}/controllers"
      config.paths['app/helpers'] << "#{app_path}/helpers"
      config.paths['app/models'] << "#{app_path}/models"
      config.paths['app/mailers'] << "#{app_path}/mailers"
      config.paths['app/views'] << "#{app_path}/views"

      
      config.paths['config'] << "#{app_path}/config"
      config.paths['config/routes.rb'] << "#{app_path}/config/routes.rb"
      config.paths['db/migrate'] << "#{app_path}/db/migrate"
      config.paths['db/seeds.rb'] << "#{app_path}/db/seeds.rb"
    end

    ['post', 'comment'].each do |domain|
      register_domain(domain)
    end
  end
end
