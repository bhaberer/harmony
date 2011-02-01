module NavigationHelpers

  def path_to(page_name)
    case page_name

    when /the home\s?page/
      '/'
    when /the new todos page/
      new_todos_path


    when /the new notes page/
      new_notes_path
    when /the edit note page/
      edit_account_note_path(Account.first, Note.first)

    when /the account page for "([^\"]*)"/
      account_path(Account.find_by_name($1))
    when /the edit account page for "([^\"]*)"/
      edit_account_path(Account.find_by_name($1))



    # Add more mappings here.
    # Here is an example that pulls values out of the Regexp:
    #
    #   when /^(.*)'s profile page$/i
    #     user_profile_path(User.find_by_login($1))

    else
      begin
        page_name =~ /the (.*) page/
        path_components = $1.split(/\s+/)
        self.send(path_components.push('path').join('_').to_sym)
      rescue Object => e
        raise "Can't find mapping from \"#{page_name}\" to a path.\n" +
          "Now, go and add a mapping in #{__FILE__}"
      end
    end
  end
end

World(NavigationHelpers)
