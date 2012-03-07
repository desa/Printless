class UsersController < ApplicationController
  before_filter :signed_in_user, only: [:index, :edit, :update]
  before_filter :current_user,   only: [:edit, :update, :destroy]
  before_filter :admin_user,     only: :destroy
  
  def destroy
    @user = User.find(params[:id])
    if @user == current_user
      @user.destroy
      redirect_to root_path
    else
      @user.destroy
      redirect_to users_path
    end
  end

  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  def show
    @user = User.find(params[:id])
    #@articles = @user.articles.paginate(page: params[:page])
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:success] = 'Profile updated'
      sign_in @user
      redirect_to @user
    else
    render 'edit'
  end
end
  
  def new
    @user = User.new
  end
  
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
  
  private
  
  def admin_user
    redirect_to(root_path) unless current_user.admin?
  end
  
end
