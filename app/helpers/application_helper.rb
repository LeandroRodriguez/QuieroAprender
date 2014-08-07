# encoding: utf-8
module ApplicationHelper
  
  def is_logued_teacher?
    if current_user.nil? then
      return false
    end
    return current_user.teacher?
  end
  
  def is_logued_student?
    if current_user.nil? then
      return false
    end
    return current_user.student?
  end
  
  def is_logued_student_with_facebook_id?
    if current_user.nil? then 
      return false
    end
    if current_user.student? then
      puts "hay un estudiante conectado"
      unless current_user.facebook_id.nil? then
        puts "El estudiante esta conectado con fb"
        return true
      end
    end
    false
  end
  
  def get_profile_picture_for_user(user)
    return user.image
    unless user.nil? then
      puts "User: #{user}"
      if not user.facebook_id.nil? and user.facebook_id != 0 then
        #puts "http://graph.facebook.com/#{user.facebook_id}/picture?type=large"
        return "http://graph.facebook.com/#{user.facebook_id}/picture?type=large"
      else
        return nil
      end
    end  
    return "http://sndt.ac.in/images/courses/courses-imgs.jpg"
  end

  def get_profile_picture_for_facebook_id(facebook_id)
    puts "Facebook ID: #{facebook_id}"
    unless user.facebook_id.nil? then
      puts "http://graph.facebook.com/#{facebook_id}/picture?type=large"
      return "http://graph.facebook.com/#{facebook_id}/picture?type=large"
    else
      return "http://sndt.ac.in/images/courses/courses-imgs.jpg"
    end
  end

  #
  # El tamaño de la imagen small es de 50x50
  #
  def get_small_profile_picture_for_user(user)
    unless user.nil? then
      puts "User: #{user}"
      if user.facebook_id then
        puts "http://graph.facebook.com/#{user.facebook_id}/picture"
        return "http://graph.facebook.com/#{user.facebook_id}/picture"
      end
    end
    return "http://sndt.ac.in/images/courses/courses-imgs.jpg"
  end

  #
  # El tamaño de la imagen small es de 50x50
  #
  def get_small_profile_picture_for_facebook_id(facebook_id)
    puts "Facebook ID: #{facebook_id}"
    unless user.facebook_id.nil? then
      puts "http://graph.facebook.com/#{facebook_id}/picture"
      return "http://graph.facebook.com/#{facebook_id}/picture"
    else
      return "http://sndt.ac.in/images/courses/courses-imgs.jpg"
    end
  end

end
