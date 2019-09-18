CarrierWave.configure do |config|
  config.fog_provider = 'fog/aws' 
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     ENV['aws_key'],
    aws_secret_access_key: ENV['aws_secret'],
    region: "us-east-2"
  }
  config.fog_directory = ENV['aws_bucket']                              # required
end
