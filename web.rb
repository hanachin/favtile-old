# -*- coding: utf-8 -*-
require 'bundler/setup'

require 'sinatra'
require 'sass'
require 'twitter'

config = YAML.load_file("config.yml")

Twitter.configure do |c|
  c.consumer_key = config["CONSUMER_KEY"]
  c.consumer_secret = config["CONSUMER_SECRET"]
  c.oauth_token = config["ACCESS_TOKEN"]
  c.oauth_token_secret = config["ACCESS_TOKEN_SECRET"]
end

get '/style.css' do
  sass :style
end

get '/?:name?' do |name|
  @favs = []
  @name = name
  if @name
    begin
      favs = Twitter.favorites(name)
      u = Twitter.user(name)
      if u.profile_use_background_image
        @bg_img = URI.encode(u.profile_background_image_url)
        @bg_repeat = if u.profile_background_tile then "repeat" else "no-repeat" end
      end
      @favs = favs
    rescue
      @notice = "favの取得に失敗しました。"
    end
  end
  haml :index
end

get '/:name/:page' do |name, page|
  @favs = []
  begin
    favs = Twitter.favorites(name, {:page => page})
    @favs = favs
  rescue
    @notice = "favの取得に失敗しました。"
  end

  content_type :json
  @favs.map {|x| x.attrs }.to_json
end
