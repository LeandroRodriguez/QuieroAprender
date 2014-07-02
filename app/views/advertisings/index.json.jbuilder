json.array!(@advertisings) do |advertising|
  json.extract! advertising, :id, :name, :description, :address, :price
  json.url advertising_url(advertising, format: :json)
end
