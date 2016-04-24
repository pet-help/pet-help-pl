class CreatePlaces < ActiveRecord::Migration
	def change

		# województwa (TERC_01012016)
		create_table :provinces do |t|
			t.string :name, limit: 64
			t.string :teryt_code, limit: 2

			t.timestamps null: false
		end

		# powiaty
		create_table :districts do |t|
			t.belongs_to :province, index: true, foreign_key: true
			t.string :name, limit: 64
			t.string :teryt_code, limit: 4
			t.string :teryt_province_code, limit: 2

			t.timestamps null: false
		end

		# gminy
		create_table :communities do |t|
			t.belongs_to :district, index: true, foreign_key: true
			t.string :name, limit: 64
			t.integer :community_type_id

			t.timestamps null: false
		end

		# typy miejscowości (WMRODZ_28022013)
		create_table :place_types do |t|
			t.string :name, limit: 32
			t.string :teryt_code, limit: 2

			t.timestamps null: false
		end
		
		# miejscowości (SIMC_01012016)
		create_table :places do |t|
			t.belongs_to :community, index: true, foreign_key: true
			t.integer :place_type_id
			t.string :name, index: true, limit: 64
			t.string :teryt_code, limit: 7
			t.string :teryt_place_type_code, limit: 2
			t.boolean :hide, default: false

			t.timestamps null: false
		end

		# części miejscowości (np. osiedla)
		create_table :place_parts do |t|
			t.belongs_to :place, index: true, foreign_key: true
			t.integer :place_type_id
			t.string :name, limit: 64
			t.string :teryt_code, limit: 7
			t.string :teryt_place_code, limit: 7
			t.string :teryt_place_type_code, limit: 2

			t.timestamps null: false
		end

	end

end
