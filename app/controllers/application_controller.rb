class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    case resouce
    when Admin
      admin_items_path
    end
  end
end
 