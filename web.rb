# -*- coding: utf-8 -*-
require 'sinatra'
require 'sass'
require 'twitter'

Twitter.configure do |config|
  config.consumer_key = "your consumer_key"
  config.consumer_secret = "your consumer_secret"
  config.oauth_token = "your oauth_token"
  config.oauth_token_secret = "your oauth_token_secret"
end

get '/style.css' do
  sass :style
end

get '/' do
  haml :index
end

get '/:name' do |name|
  @favs = []
  @name = name
  begin
    fav = Twitter.favorites(name).map {|t| t.text }
    @favs = fav
  rescue
    @notice = "favの取得に失敗しました。"
  end
  haml :fav
end
