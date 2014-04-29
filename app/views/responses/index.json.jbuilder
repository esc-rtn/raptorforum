json.array!(@responses) do |response|
  json.extract! response, :id, :topic_id, :content, :postdate
  json.url response_url(response, format: :json)
end
