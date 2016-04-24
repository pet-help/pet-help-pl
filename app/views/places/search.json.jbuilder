json.array!(@places) do |place|
	label = "#{place["place_name"]} (#{place["place_type_name"]}), gmina #{place["community_name"]}, powiat #{place["district_name"]}"
  json.id       place["place_id"]
  json.label    label
  json.value    place["place_name"]
end
