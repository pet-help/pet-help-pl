class Community < ActiveRecord::Base
	belongs_to :district, class_name: "District", foreign_key: "district_id"
	has_many :places, foreign_key: "community_id", primary_key: "id"
end
