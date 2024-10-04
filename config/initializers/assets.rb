# config/initializers/assets.rb

Rails.application.config.assets.version = '1.0'

Rails.application.config.assets.paths << Rails.root.join('app', 'javascript', 'stylesheets')

Rails.application.config.assets.precompile += %w( application.css door_installations.css new_door_installation.css edit_door_installation.css delivered_deliveries.css new_delivered_delivery.css edit_delivered_delivery.css requested_deliveries.css edit_requested_delivery.css )
