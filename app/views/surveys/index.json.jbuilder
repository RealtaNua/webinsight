json.array!(@surveys) do |survey|
  json.extract! survey, :id, :theme_id, :description
  json.url survey_url(survey, format: :json)
end
