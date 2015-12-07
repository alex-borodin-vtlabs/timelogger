json.array!(@ztasks) do |ztask|
  json.extract! ztask, :id, :name, :zproject_id
  json.url ztask_url(ztask, format: :json)
end
