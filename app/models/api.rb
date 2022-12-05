require 'rspotify'
window.onSpotifyWebPlaybackSDKReady = () => {
  const token = ENV.fetch("SPOTIFY_TOKEN");
  const player = new Spotify.Player({
    name: 'Web Playback SDK Quick Start Player',
    getOAuthToken: cb => { cb(token); },
    volume: 0.5
  });


