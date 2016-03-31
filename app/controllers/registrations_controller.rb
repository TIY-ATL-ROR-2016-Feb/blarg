class RegistrationsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(first_name: params["first"],
                     last_name: params["last"],
                     email: params["email"],
                     password: params["password"])
    if @user.save
      redirect_to :root
    else
      render :new
    end
  end
end
