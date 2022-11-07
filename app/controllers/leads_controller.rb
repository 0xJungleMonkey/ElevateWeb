class LeadsController < ApplicationController
    protect_from_forgery 
def create
    Lead.create!(
        Full_name_of_the_contact: params[:name],
        Bussiness_name: params[:bussinessname],
        Email: params[:email],
        Phone: params[:phone],
        Project_name: params[:department],
        Project_description: params[:projectname],
        Department_incharge: params[:projectdescription],
        Message: params[:message],
        Attached_file: params[:attachment],
        
    )
end
end
