json.array!(@leads) do |lead|
  json.extract! lead, :id, :email, :channel
  json.url lead_url(lead, format: :json)
end
