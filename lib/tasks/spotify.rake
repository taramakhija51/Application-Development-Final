task :hello => :environment do
  require 'rspotify'
  require 'net/http'
  require 'uri' 
  p "hi"
  RSpotify.authenticate(ENV.fetch("spotify_key"), ENV.fetch("spotify_secret"))
  me = RSpotify::User.find('tmakhija')
  me.playlists #=> (Playlist array)
  playlist = RSpotify::Playlist.find('tmakhija', '4JaxDwnOfaBvlNNyZTM4FQ')
  playlist.name               #=> "d33p"
  playlist.description        #=> "d33p h0uz"
  playlist.followers['total'] #=> 1
  songs = playlist.tracks
 # p songs.images 
           #=> (Track array)
  song = RSpotify::Track.find('3jlbL2OTD5YmIunYzgQTAN')
  p song.audio_features.mode
  p song.audio_features.key
  #track = RSpotify::Track.find('34xTFwjPQ1dC6uJmleno7x')
  # songs.each do |s|
  #   track_id = s.id
  #   track_name = s.name
  #   key = s.audio_features.key
  #   bpm = s.audio_features.tempo
  #   mode = s.audio_features.mode
  #   c = (7*key + 3*mode + 5) % 12 
  #   if c == 0
  #     c = 12
  #   else
  #     c = c + 1
  #   end
  #   if mode = 1
  #     camelot_key = c.to_s + "B"
  #   elsif mode = 0
  #     camelot_key = c.to_s + "A"
  #   end
  #   p camelot_key
  #   p track_id
  #   p bpm
  #   p (" ")



  #p track.name
  #require 'net/http'
  #require 'uri'
  # uri = URI.parse("https://api.spotify.com/v1/audio-analysis/7yNf9YjeO5JXUE3JEBgnYc")
  # request = Net::HTTP::Get.new(uri)
  # request.content_type = "application/json"
  # request["Authorization"] = ""

  # req_options = {
  #   use_ssl: uri.scheme == "https",
  # }

  # response = Net::HTTP.start(uri.hostname, uri.port, req_options) do |http|
  #   http.request(request)
  # end
  # p response
  
  # def track
  #   track = "7yNf9YjeO5JXUE3JEBgnYc"
  #   track.loudness = loudness
  #   track.pitches = pitches
  # end
  # p loudness
  #STDIN.puts "What is your track url?"
  #track = STDIN.gets.chomp("https://open.spotify.com/album/")
  #p track
 #pull individual track major/minor etc to reorganize playlists by camelot wheel key such that the bpms are closest to one another
 #organize ascending BPM such that all tracks are within 1 number key if the same letter or the same k regardless of 
 #cut out fade-in fade-out times MAYBE
end
