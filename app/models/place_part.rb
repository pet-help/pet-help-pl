class PlacePart < ActiveRecord::Base
	belongs_to :place, class_name: "Place", foreign_key: "place_id", primary_key: "id"
	has_and_belongs_to_many :streets
end
