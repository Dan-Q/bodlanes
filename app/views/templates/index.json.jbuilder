json.array!(@templates) do |template|
  json.extract! template, :id, :screen_type, :name, :code
  json.url template_url(template, format: :json)
end
