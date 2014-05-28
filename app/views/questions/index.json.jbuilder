json.array!(@questions) do |question|
  json.extract! question, :id, :survey_id, :type_id, :description
  json.url question_url(question, format: :json)
end
