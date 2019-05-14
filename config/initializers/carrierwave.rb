CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws'                        # required
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     Rails.application.credentials.aws[:key],
    aws_secret_access_key: Rails.application.credentials.aws[:secret],
    region: "us-east-2"
  }
  config.fog_directory  = Rails.application.credentials.aws[:bucket]                              # required
end
