class Province < ActiveRecord::Base
	has_many :districts, foreign_key: "province_id", primary_key: "id"

	def self.search(term)
	  where('LOWER(name) LIKE :term', term: "%#{term.downcase}%")
	end

end
