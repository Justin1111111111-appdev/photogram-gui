class UsersController < ApplicationController
  def index 
    matching_users = User.all

    @list_of_users = matching_users.order({ :username => :asc })

    render({ :template => "user_templates/index.html.erb"})
  end

  def show 

    #Parameters: {"path_username"=>"anisa"}
    url_username = params.fetch("path_username")

    matching_usernames = User.where({ :username => url_username })

    @the_user = matching_usernames.at(0)

    #if the_user == nil 
      #redirect_to("/")
    #else
      render({ :template => "user_templates/show.html.erb"})
    #end
  end

  def create 
    #Parameters: {"image"=>"Justin"}

  input_user = params.fetch("image")

  a_new_user = User.new

  a_new_user.username = input_user

  a_new_user.save
  
    
  render({ :template => "user_templates/create.html.erb" })

    #redirect_to("/users/ #{a_new_user.username}")
    
  end

  def update


    the_id = params.fetch("update")

    matching_users = User.where({ :id => the_id})

    the_user = matching_users.at(0)

    input_user = params.fetch("image")

    the_user.username = input_user
  
    the_user.save

    render({ :template => "user_templates/update.html.erb" })
    #next_url = "/users/" + the_user.id.to_s
    #redirect_to(next_url)
  end
end  
