class Lead < ApplicationRecord
  after_create :sendAttachedFile
  require 'dropbox_api'

  has_one_attached :image
  validate :acceptable_image

  def acceptable_image
    return unless image.attached?

    if image.byte_size > 1.megabyte
      image_size = (image.byte_size / 1_000_000.0).round(2)
      errors.add(:image, "size #{image_size} MB exceeds 1 MB limit")
    end

    acceptable_types = ['image/jpeg', 'image/jpg', 'image/png']
    errors.add(:image, 'must be a JPEG or PNG') unless acceptable_types.include?(image.content_type)
  end


  # define the after_save action to remove an image
  def remove_attached_image?
    remove_attached_image == '1'
  end

  def purge_attached_image
    image.purge_later
  end

  attr_accessor :remove_attached_image
  after_save :purge_attached_image, if: :remove_attached_image?
  # def sendAttachedFile
  #
  #
  #   # unless self.Attached_file.nil?
  #   #   # varNameForPath = '/client_folder'
  #   #   client = DropboxApi::Client.new(ENV["OAuthToken"])
  #   #   # begin
  #   #   #   client.upload("/#{self.Full_name_of_the_contact}/file", self.Attached_file)
  #   #
  #   #   begin
  #   #     client.create_folder("/DoomSlayer")
  #   #     file_content = IO.read(self.Attached_file)
  #   #
  #   #   # test = Lead.first
  #   #   # binary = test.Attached_file
  #   #   #
  #   #   # client = Dropbox...new...
  #   #   #   client.upload(somePath, binary)
  #   #
  #   #     # client.upload("/DoomSlayer/duck", self.Attached_file)
  #   #     client.upload("/DoomSlayer/duck", file_content)
  #     end
  #   end
  # end
end
