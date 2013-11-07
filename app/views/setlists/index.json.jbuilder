json.array!(@setlists) do |setlist|
  json.extract! setlist, :user_id, :show_id
  json.url setlist_url(setlist, format: :json)
end
