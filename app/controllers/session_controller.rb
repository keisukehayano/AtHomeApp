class SessionController < ApplicationController
  def create
    pp '#### ユーザーログイン ####'
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      pp '#### ログイン成功 ####'
      session[:user_id] = user.id
      redirect_to root_path
    else
      pp '#### ログイン失敗 ####'
      redirect_to root_path
    end
  end

  def destroy
    pp '#### ログアウト ####'
    session.delete(:user_id)
    redirect_to root_path
  end
end
