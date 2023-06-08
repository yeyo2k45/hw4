class SessionsController < ApplicationController

  def create
    #authenticate the user
    @user = User.find_by({ "username" => params["username"] })
    if @user
      if BCrypt::Password.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Welcome, #{@user["username"]}."
        redirect_to "/places"
      else
        flash["notice"] = "Nope."
        redirect_to "/places"
      end
    else
      flash["notice"] = "Nope."
      redirect_to "/places"
    end
  end
  def destroy
    session["user_id"] = nil
    flash["notice"] = "Goodbye."
    redirect_to "/login"
  end
end