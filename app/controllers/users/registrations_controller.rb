# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  before_action :configure_sign_up_params, only: [:create]
  before_action :configure_account_update_params, only: [:edit, :update]

  def new
    super
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "ユーザー認証メールを送信いたしました。認証が完了しましたらログインをお願いいたします。"
      redirect_to root_path
    else
      flash[:alert] = "ユーザー登録に失敗しました。"
      render action: :new and nil
    end
  end

  # GET /resource/edit
  def edit
    super
  end


  def update
    super
    if @user.update(user_params)
      flash[:success] = "更新しました。"
      redirect_to @user
    else
      return
    end
  end


  def destroy
    super
  end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :user_name)
    end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  end

  # If you have extra params to permit, append them to the sanitizer.
  def configure_account_update_params
    devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  end

  # The path used after sign up.
  def after_sign_up_path_for(resource)
    super(resource)
  end

  # The path used after sign up for inactive accounts.
  def after_inactive_sign_up_path_for(resource)
    super(resource)
  end
end
