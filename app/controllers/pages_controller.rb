class PagesController < ApplicationController
  def index
  end

  def home
    @user_events = current_user.events
  end
  def follower
    @followers = User.find_by_username(params[:username]).followers
  end
  def following

  end

  def orgnew
  end

  def search
    @users = User.where("username like ? ", "%#{params[:username].chomp.strip}%")
    @cats = Event.where("title like ? ", "%#{params[:username].chomp.strip}%")

    if User.all.count == @users.length
      @users = []
    end

    if Event.all.count == @cats.length
      @cats = []
    end





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
