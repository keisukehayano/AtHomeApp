class ApplicationController < ActionController::Base

    before_action :current_user

    private

        def current_user
            pp '#### 現在のログインユーザー取得 ####'
            user = session[:user_id]
            pp "#### ユーザーID: #{user} ####"
            return unless session[:user_id]
            @current_user = User.find_by(id: session[:user_id])
        end
end
