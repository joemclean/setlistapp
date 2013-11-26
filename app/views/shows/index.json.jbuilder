json.array!(@shows) do |show|
  json.extract! show, :date, :venue, :time
  json.url show_url(show, format: :json)
end
