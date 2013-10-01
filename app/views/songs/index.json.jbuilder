json.array!(@songs) do |song|
  json.extract! song, :id
  json.extract! song, :name
end
