class District < ActiveRecord::Base
	belongs_to :province, class_name: "Province", foreign_key: "province_id"
	has_many :communities
end
