class LeadsController < ApplicationController
  protect_from_forgery
  # skip_before_action :verify_authenticity_token
  def create

    lead = Lead.create!(
      Full_name_of_the_contact: params[:name],
      Bussiness_name: params[:bussinessname],
      Email: params[:email],
      Phone: params[:phone],
      Project_name: params[:department],
      Project_description: params[:projectname],
      Department_incharge: params[:projectdescription],
      Message: params[:message],
      Attached_file: params[:Attached_file]
    )

  end

  # private
  #
  # def image?
  #   params[:Attached_file]&.read
  # end

end
