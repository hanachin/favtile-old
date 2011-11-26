# -*- coding: utf-8 -*-
require 'twitter'
require 'pp'

Twitter.configure do |config|
  config.consumer_key = "your consumer_key"
  config.consumer_secret = "your consumer_secret"
  config.oauth_token = "your oauth_token"
  config.oauth_token_secret = "your oauth_token_secret"
end

# ふぁぼの取り方
# pp Twitter.favorites("yasulab")

# フォロワーの取り方
# pp Twitter.follower_ids("yasulab")

pp Twitter.favorites("yasulab").map {|t| t.text }
