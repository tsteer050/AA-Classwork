
# You can use partials as well. 
# The following will render the file
#  views/comments/_comments.json.jbuilder, 
#  and set a local variable comments with all 
#  this message's comments, which you can use inside the partial.

json.partial! 'api/guests/guest', guest: @guest

json.gifts do
  json.array! @guest.gifts do |gift|
    json.extract! gift, :title, :description
  end
end


