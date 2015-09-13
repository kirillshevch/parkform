require File.expand_path('../boot', __FILE__)

require 'rails/all'

Bundler.require(*Rails.groups)

module Parkform
  class Application < Rails::Application
    config.active_record.raise_in_transactional_callbacks = true
    config.assets.paths << Rails.root.join("vendor", "assets", "bower_components")
    config.assets.precompile << %r(.*.(?:eot|svg|ttf|woff|woff2)$)
    config.i18n.available_locales = :en
    config.i18n.default_locale = :en
    config.generators do |g|
      g.test_framework :rspec
      g.template_engine :haml
    end
  end
end
