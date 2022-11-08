ActiveAdmin.register Elevator do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :columns_id, :SerialNumber, :Model, :Type, :Status, :CommisionDate, :LastInspectionDate, :InspectionCert, :Information, :Notes
  #
  # or
  #
  # permit_params do
  #   permitted = [:columns_id, :SerialNumber, :Model, :Type, :Status, :CommisionDate, :LastInspectionDate, :InspectionCert, :Information, :Notes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
