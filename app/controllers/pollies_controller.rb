class PolliesController < ApplicationController
  require "aws-sdk-polly"  
  def index
    polly = Aws::Polly::Client.new(region: 'us-west-2')
    contents = IO.read('./lib/Greeting.txt')
    resp = polly.synthesize_speech({
        output_format: "mp3",
        text: contents,
        voice_id: "Joanna",
    })
    # name = File.basename('EmployeeList')

  # Split up name so we get just the xyz part
    # parts = name.split(".")
    # first_part = parts[0]
    # mp3_file = name + ".mp3"
    # IO.copy_stream(resp.audio_stream, mp3_file) 
    # send_data resp.audio_stream.read, type: 'audio/mpeg', disposition: 'inline'
    IO.copy_stream(resp.audio_stream, "./public/output.mp3") 

    # puts "Wrote MP3 content to: " + mp3_file
    # raise resp.audio_stream.to_s.inspect
end
end

  