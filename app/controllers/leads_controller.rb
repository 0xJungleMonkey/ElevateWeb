class LeadsController < ApplicationController
  # protect_from_forgery
  skip_before_action :verify_authenticity_token
  def create
    puts "params: #{params}"
    lead = Lead.create!(
      Full_name_of_the_contact: params[:name],
      Bussiness_name: params[:bussinessname],
      Email: params[:email],
      Phone: params[:phone],
      Project_name: params[:department],
      Project_description: params[:projectname],
      Department_incharge: params[:projectdescription],
      Message: params[:message],
      Attached_file: image?
    )

  end

  # private
  #
  # def image?
  #   params[:Attached_file]&.read
  # end

  def post_params
    params.require(:post).permit(:title, :body, :image, :remove_attached_image)
  end
end
