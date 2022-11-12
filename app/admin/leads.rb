ActiveAdmin.register Lead do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :Full_name_of_the_contact, :Bussiness_name, :Email, :Phone, :Project_name, :Project_description, :Department_incharge, :Message, :Attached_file
  #
  # or
  #
  # permit_params do
  #   permitted = [:Full_name_of_the_contact, :Bussiness_name, :Email, :Phone, :Project_name, :Project_description, :Department_incharge, :Message, :Attached_file]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
