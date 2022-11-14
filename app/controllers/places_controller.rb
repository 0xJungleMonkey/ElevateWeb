class PlacesController < InheritedResources::Base

  private

    def place_params
      params.require(:place).permit(:name, :latitude, :longitude)
    end

end
