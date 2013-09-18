Rails.application.config.middleware.use OmniAuth::Builder do
  # provider :developer unless Rails.env.production?
  provider :twitter, ENV['T4cynN1Kq30cWyhQ8uhzVQ'], ENV['94xsh1SrEpV0Zefd8zQmY3dDaWjpdExfJqUMpl5zU']
end