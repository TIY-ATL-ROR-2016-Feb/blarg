class LoginsController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.find_by(email: params["email"],
                         password: params["password"])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "You are now logged in."
      redirect_to :root
    else
      flash[:notice] = "Could not find matching username and password."
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to :root
  end
end
