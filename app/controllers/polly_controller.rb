require 'aws-sdk-rails'
require 'aws-sdk' 
require 'aws-sdk-s3', '~> 1'

Aws.config.update(
    region: us-east-1,
    credentials: Aws::Credentials.new('ENV["iam_access_key"]', 'ENV["iam_secret_key"]'),
  
  )
  
    class Synthesizer
        def initialize(region='us-east-1')
        @polly = Aws::Polly::Client.new(region: region)
        end
        def synthesize(text, file_name="./tmp.mp3", voice_id="Tatyana")
        @polly.synthesize_speech(
            text: "Hello!",
            output_format: "mp3",
            # You can use voice IDs http://docs.aws.amazon.com/polly/latest/dg/API_Voice.html
            # If you want to synthesize Japanese voice, you can use "Mizuki"
            voice_id: voice_id
        )
        end
    end