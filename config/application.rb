require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GauraGenghisKhan
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1
    
    config.i18n.default_locale = :ja

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    
    # after_initialize do
    #   ActiveSupport::Reloader.to_prepare do
    #     guest_user = User.find_by(email: User::GUEST_USER_EMAIL)
        
    #     guest_user.reviews.each { |review| review.destroy } if guest_user.reviews.any?
    #     guest_user.review_comments.each { |comment| comment.destroy } if guest_user.review_comments.any?
    #     guest_user.post_boards.each { |board| board.destroy } if guest_user.post_boards.any?
    #   end
    # end
    config.after_initialize do
      guest_user = User.find_by(email: User::GUEST_USER_EMAIL)
      
      guest_user.reviews.each { |review| review.destroy } if guest_user.reviews.any?
      guest_user.review_comments.each { |comment| comment.destroy } if guest_user.review_comments.any?
      guest_user.post_boards.each { |board| board.destroy } if guest_user.post_boards.any?
    end
    
  end
  
end
