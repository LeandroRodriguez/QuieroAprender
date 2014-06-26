json.array!(@courses) do |course|
  json.extract! course, :id, :name, :description, :longitude, :latitude, :address ,:subcategory_id, :price, :tags
  json.url course_url(course, format: :json)
end
