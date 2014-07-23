json.array!(@responses) do |response|
  json.extract! response, :id, :choice_id, :content
  json.url response_url(response, format: :json)
end
