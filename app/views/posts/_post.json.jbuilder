json.extract! post, :id, :userid, :photo, :gpslon, :gpslat, :posttime, :title, :commentid, :comment, :created_at, :updated_at
json.url post_url(post, format: :json)
json.photo url_for(post.photo)
