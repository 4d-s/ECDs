class ApplicationController < ActionController::Base
  #ユーザ登録、ログイン認証などが実行される前に、下のconfigure_permitted_parametersが実行される
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected#ストロングパラメータ

  def configure_permitted_parameters
  	#ユーザ登録(sign_up)の際、ユーザ名(name)のデータ操作が許可される
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :last_name, :first_name, :last_name_katakana, :first_name_katakana, :street_address,:postal_code, :phone_number])
    devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
  end
end
