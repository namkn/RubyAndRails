Rails.application.config.middleware.use OmniAuth::Builder do


provider :facebook, CONFIG[:facebook_id], CONFIG[:facebook_secret]
 	#provider :twitter, CONFIG[:twitter_key], CONFIG[:twitter_secret]
end