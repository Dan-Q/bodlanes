json.array!(@content_areas) do |content_area|
  json.extract! content_area, :id, :template, :name, :width, :height, :content_type
  json.url content_area_url(content_area, format: :json)
end
