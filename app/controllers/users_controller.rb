class UsersController < ApplicationController
  before_filter :signed_in_user,
                only: [:index, :edit, :update, :following, :followers]
  before_filter :current_user,   only: [:edit, :update, :destroy]
  before_filter :admin_user,     only: :destroy

  def change_password
    @user = User.find(params[:id])
    redirect_to @user unless @user == current_user
  end
  
  # Function deletes the current user and returns them to the root path #
  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      @user.destroy
      redirect_to root_path
    elsif  current_user.admin
      @user.destroy
      redirect_to users_path
    else
      redirect_to users_path
    end
  end

  # Creates an index of users to paginate #
  def index
    @users = User.paginate(page: params[:page])
  end
  
  # Gets a user based on params for show page #
  def show
    @user = User.find(params[:id])
    @articles = @user.articles.paginate(page: params[:page])
    @projects = @user.projects.paginate(page: params[:page])
  end

  # Gets a user based on params for edit page #  
  def edit
    @user = User.find(params[:id])
    redirect_to @user unless @user == current_user
  end

  # Updates a user based on params from edit page #  
  ### NOTE NEED TO FIX HERE FOR PASSWORD PAGE### 
    #params.select {
   #   |param| [:name, :email, :twitter, :about_me, :interests].include? param
    #}
  def update
    @user = User.find(params[:id])
    if update_edit_attributes
      sign_in @user
      redirect_to @user
    else
    render 'edit'
    end
  end
  
  # Obvi brah, new instance brah #
  def new
    if signed_in?
      redirect_to current_user
    else
      @user = User.new
    end
  end
  
  # brooooahahah #
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to Printless!"
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def following
    @title = "Following"
    @user  = User.find(params[:id])
    @users = @user.followed_users.paginate(page: params[:page])
    render 'show_follow'
  end
  
  def followers
    @title = "Followers"
    @user  = User.find(params[:id])
    @users = @user.followers.paginate(page: params[:page])
    render 'show_follow'
  end
  
  
  private
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
  
  def update_edit_attributes
    thing = [:name, :image, :email, :twitter_id, :about_me]
    validity = true
    thing.each do |attribute|
      if @user.update_attribute(attribute, params[:user][attribute])
        validity = true && validity
      else
        validity = false && validity
      end
    end
  end
  
end
