class PagesController < ApplicationController
  def index
  end

  def home
    @user_events = current_user.events
  end

  def orgnew
  end

  def profile
    if (User.find_by_username(params[:id]))
      @username = params[:id]
    else
      redirect_to root_path, :notice=> "User not found"
  end
  @user_events = UserEvent.where(user_id: current_user.id)
end

  def explore
  end
end
