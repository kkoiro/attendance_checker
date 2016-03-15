json.array!(@participants) do |participant|
  json.extract! participant, :id, :name, :classification_id, :status
  json.url participant_url(participant, format: :json)
end
