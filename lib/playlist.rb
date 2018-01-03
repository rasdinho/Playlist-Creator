class Playlist < ActiveRecord::Base

  has_many :song_playlists
  has_many :songs, through: :song_playlists

  def self.make_new_from(name, parameter, value)
    feature_hash = {name: name, tempo: nil, key: nil, mode: nil, time_signature: nil, danceability: nil, valence: nil, acousticness: nil, energy: nil, instrumentalness: nil}
    feature_hash[parameter.to_sym] = value
    new_playlist = self.create(feature_hash)
    relevant_songs = Song.select_by(parameter, value)
    self
  end



end








# if SongPlaylist.find_by(song_id: song.id, playlist_id: self.id)
#   puts "This song is already in your playlist"
# else
#   new_playlist.songs << song
# end