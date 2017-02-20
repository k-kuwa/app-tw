CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:                'AWS',
    aws_access_key_id:       ENV['AWS_ACCESS_KEY_ID'],
    aws_secret_access_key:   ENV['AWS_SECRET_ACCESS_KEY'],
    region:                  'ap-northeast-1'
  }

  config.fog_directory = 'app-tw-pro' if Rails.env.production?
  config.fog_directory = 'app-tw-dev' if Rails.env.development?

end
