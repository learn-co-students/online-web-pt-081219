# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :developer unless Rails.env.production?
  provider :github, ENV['GITHUB_KEY'], ENV['GITHUB_SECRET']
  provider :google_oauth2, ENV['GOOGLE_KEY'], ENV['GOOGLE_SECRET']
end
