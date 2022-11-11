class Lead < ApplicationRecord
  after_create :sendAttachedFile
  require 'dropbox_api'
  def sendAttachedFile


    unless self.Attached_file.nil?
      # varNameForPath = '/client_folder'
      client = DropboxApi::Client.new(ENV["OAuthToken"])
      # begin
      #   client.upload("/#{self.Full_name_of_the_contact}/file", self.Attached_file)

      begin
        client.create_folder("/DoomSlayer")
        file_content = IO.read(self.Attached_file)

      # test = Lead.first
      # binary = test.Attached_file
      #
      # client = Dropbox...new...
      #   client.upload(somePath, binary)

        # client.upload("/DoomSlayer/duck", self.Attached_file)
        client.upload("/DoomSlayer/duck", file_content)
      end
    end
  end
end
