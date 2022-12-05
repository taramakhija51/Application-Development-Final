require 'rspotify'
require 'rest-client'
require 'json'
require 'oauth2'
require 'net/http'
require 'uri' 

class ApplicationController < ActionController::Base
  def track_list
    RSpotify.authenticate(ENV.fetch("spotify_key"), ENV.fetch("spotify_secret"))
    @me = RSpotify::User.find('tmakhija')
    @me.playlists #=> (Playlist array)
    @playlist = RSpotify::Playlist.find('tmakhija', '2H8dGdMfZqa82umDKp87yG')
    @playlist.name               #=> "d33p"
    @playlist.description        #=> "d33p h0uz"
    @playlist.followers['total'] #=> 1
    @songs = @playlist.tracks          #=> (Track array)
    #track = RSpotify::Track.find('34xTFwjPQ1dC6uJmleno7x')
    render({ :template => "/track_templates/index.html.erb"})
  end
 #pull individual track major/minor etc to reorganize playlists by camelot wheel key such that the bpms are closest to one another
 #organize ascending BPM such that all tracks are within 1 number key if the same letter or the same k regardless of 
 #cut out fade-in fade-out times MAYBE



  def homepage
    render({ :template => "/track_templates/index.html.erb"})
  end

  def index
    p "hi"
    require 'rspotify' 
    me = RSpotify::User.find('tmakhija')
    me.playlists #=> (Playlist array)
    render({ :template => "/track_templates/index.html.erb"})

    artists = RSpotify::Artist.search('Arctic Monkeys')
    arctic_monkeys = artists.first
    arctic_monkeys.popularity      #=> 74
    arctic_monkeys.genres          #=> ["Alternative Pop/Rock", "Indie", ...]
    arctic_monkeys.top_tracks(:US) #=> (Track array)
  end
#https://accounts.spotify.com/authorize?client_id=YOURCLIENTIDHERE&redirect_uri=YOURENCODEDURIHERE&scope=user-read-private%20user-read-email&response_type=token&state=123
#http%3A%2F%2Flocalhost%3A8080%2Foauth2%2Fcallback

#https://accounts.spotify.com/authorize?client_id=a3c13b26a48b411fa5dd7d63d73b787b&redirect_uri=http%3A%2F%2Flocalhost%3A8080%2Foauth2%2Fcallback&scope=user-read-private%20user-read-email&response_type=token&state=123

  def show
    render({ :template => "track_templates/index.html.erb"})
  end
end
