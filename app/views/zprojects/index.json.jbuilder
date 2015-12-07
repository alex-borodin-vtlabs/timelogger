json.array!(@zprojects) do |zproject|
  json.extract! zproject, :id, :name
  json.url zproject_url(zproject, format: :json)
end
