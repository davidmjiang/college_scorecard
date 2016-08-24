module ApplicationHelper

  def navbar
    if signed_in_user?
      render "layouts/navbarlogin"
    else
      render "layouts/navbar"
    end
  end

end
