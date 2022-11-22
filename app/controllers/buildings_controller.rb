class BuildingsController < ApplicationController
    def get_buildings_by_customer_id
        @buildings = Building.where("customer_id = ?", params[:customer_id])
        respond_to do |format|
          format.json { render :json => @buildings }
        end
      end
      # def building_search
      #   if params[:customer].present? && params[:customer].strip != ""
      #     @buildings = Building.where("customer_id = ?", params[:customer])
      #   else
      #     @buildings = Building.all
      #   end
      # end
end
