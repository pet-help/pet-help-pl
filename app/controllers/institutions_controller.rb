class InstitutionsController < ApplicationController
	def index
		@institutions = Institution.all
	end

	def search
		respond_to do |format|
			format.js { 
				@institutions = Institution.where(place_id: params[:place_id].to_i)	
				#binding.pry 
			}
		end			
	end

end
