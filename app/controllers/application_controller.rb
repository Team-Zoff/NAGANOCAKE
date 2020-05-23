class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
        admins_homes_top_path
    else
      members_member_path
    end
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
    if resource == Member
      new_admin_admin_member_session_path
    else
      root_path
    end
  end

  protected
  def configure_permitted_parameters
        added_attrs = [:first_name,:last_name,:first_name_kana,:last_name_kana,:postal_code,:telephone,:address]
        devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
        devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
