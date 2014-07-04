json.array!(@themes) do |theme|
  json.extract! theme, :id, :name, :description, :csscontent
  json.url theme_url(theme, format: :json)
end
