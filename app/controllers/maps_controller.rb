class MapsController < InheritedResources::Base

  private

    def map_params
      params.require(:map).permit()
    end

end
