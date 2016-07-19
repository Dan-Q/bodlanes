json.array!(@scren_types) do |scren_type|
  json.extract! scren_type, :id, :name, :width, :height
  json.url scren_type_url(scren_type, format: :json)
end
