class Members::ApplicationController < ActionController::Base


before_action :configure_permitted_parameters, if: :devise_controller?

protected
  def configure_permitted_parameters
        added_attrs = [:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:telephone,:address]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
      admin_homes_top_path
    else
      root_path
    end
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :admin_admin_user
      new_admin_admin_user_session_path
    else
      root_path
    end
  end
end

