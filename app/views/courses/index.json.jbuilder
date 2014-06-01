json.array!(@courses) do |course|
  json.extract! course, :id, :name, :description, :longitude, :latitude, :address
  json.url course_url(course, format: :json)
end
