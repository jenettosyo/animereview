class UsersController < ApplicationController

  def show
  end

  def edit
    @user = User.find(current_user.id)
  end
end
