class ApplicationController < ActionController::Base
  # before_action :authenticate_user!, except: [:top,:about,:check]
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  
  def after_sign_up_path_for(resource)
    top_path
  end
  
  # ログイン後の画面遷移先設定
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      # adminユーザー
      admin_menus_path
      
    else
      # publicユーザー
      top_path
    end
  end
  
  # ログアウト後の画面遷移先設定
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin
      # adminユーザー
      new_admin_session_path
      
    else
      # publicユーザー
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
  
end
