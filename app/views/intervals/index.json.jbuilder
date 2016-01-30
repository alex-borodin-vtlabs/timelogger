json.array!(@intervals) do |interval|
  json.extract! interval, :id, :intrvlbegin, :intrvlend, :task_id
  json.url interval_url(interval, format: :json)
end
