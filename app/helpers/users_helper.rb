module UsersHelper

  def edit_button
    link_to "Edit User", edit_user_path(current_user), class: "btn btn-primary" if current_user == @user
  end

end
