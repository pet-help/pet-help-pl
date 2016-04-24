class Place < ActiveRecord::Base
	has_many :parts, class_name: "PlacePart", foreign_key: "place_id", primary_key: "id"
	has_many :streets
	belongs_to :community
end
