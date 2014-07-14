class LoginController < ApplicationController
  def index
    @login = Login.new
  end
  def signin
    @login = Login.new
  end
  
  
  # private
    # def login_params
      # if :login.nil?
        # params.permit(:email,:password)
      # else
        # params.require(:login).permit(:email,:password)
      # end
    # end
end