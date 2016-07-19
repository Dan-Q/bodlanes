json.array!(@presentations) do |presentation|
  json.extract! presentation, :id, :name
  json.url presentation_url(presentation, format: :json)
end
