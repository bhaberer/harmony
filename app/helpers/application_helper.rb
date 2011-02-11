module ApplicationHelper

  def avatar_url(user)
    gravatar_id = Digest::MD5.hexdigest(user.email.downcase)
    "http://gravatar.com/avatar/#{gravatar_id}.png?s=48&d=identicon"
  end

  def event_text(event)
    case event.event_type
    when "new_note"
      event.note.feed_text
    when "new_todo"
      "#{event.user.name} added a new todo."
    when "new_list"
      "#{event.user.name} added a new list."
    when "new_item"
      "#{event.user.name} added a new item to a list."
    else 
      "NO TEXT FOR #{event.event_type}"
    end
  end


end
