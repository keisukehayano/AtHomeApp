class UsersController < ApplicationController
  def new
    pp '#### ユーザーNEW ####'
    @user = User.new
  end


  def create
    pp '#### ユーザー登録処理 ####'
    user = User.new(user_params)
    user.user_image.attach(params[:user][:user_image])
    if user.save
      session[:user_id] = user.id
      redirect_to root_path
    else
      pp '#### ユーザー登録失敗 ####'
      redirect_back(fallback_location: new_user_path)
    end
  end

  def login
    pp '#### ログインパス ####'
  end

  def me
    pp '#### マイページ ####'
  end


  private

    #ストロングパラメーター
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_image)
    end

end
