module ApplicationHelper
  def get_profile_picture_for_user(user)
    puts "User: #{@user}"
    #if user.facebook_id then
     # puts "http://graph.facebook.com/#{@user.facebook_id}/picture"
      #return "http://graph.facebook.com/#{@user.facebook_id}/picture"
    #else
      return "http://sndt.ac.in/images/courses/courses-imgs.jpg"
    #end
  end
end
