json.array!(@topics) do |topic|
  json.extract! topic, :id, :description, :content, :postdate
  json.url topic_url(topic, format: :json)
end
