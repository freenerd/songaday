json.array!(@songs) do |song|
  json.extract! song, :embed, :artist, :title, :story
  json.url song_url(song, format: :json)
end
