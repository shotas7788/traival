class RegistrationsController < Devise::RegistrationsController

  protected

  def update_resource(resource, params)
    resource.update_without_current_password(params)
  end
  
  # ==========アップデート後の遷移先==========
  def after_update_path_for(resource)
    user_path(resource)
  end
  # ==========アップデート後の遷移先==========
end