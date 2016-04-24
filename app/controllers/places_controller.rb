class PlacesController < ApplicationController

	def search
	  respond_to do |format|
	    format.html
	    # format.json { 
	    # @provinces = Province.search(params[:term])
	    # binding.pry }
	    format.json { 
	    @places = searchplace(params[:term], params[:province])
	    #binding.pry 
	  	}
	  end
	end

		private

	def searchplace(term, province)
		sql = "SELECT place_types.name AS place_type_name, places.id AS place_id, places.name AS place_name, communities.name AS community_name, districts.name AS district_name FROM places INNER JOIN communities ON places.community_id=communities.id JOIN districts ON communities.district_id=districts.id JOIN place_types ON places.place_type_id = place_types.id WHERE districts.province_id=#{province} AND places.name ILIKE '%#{term}%' AND places.hide = FALSE;"
		ActiveRecord::Base.connection.execute(sql)
	end
end
