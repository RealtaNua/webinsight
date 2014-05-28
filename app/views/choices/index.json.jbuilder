json.array!(@choices) do |choice|
  json.extract! choice, :id, :question_id, :description
  json.url choice_url(choice, format: :json)
end
