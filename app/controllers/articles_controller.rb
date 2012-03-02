class ArticlesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]

  def index
  end

  def create
    @aricle = current_user.aricle.build(params[:aricle])
    if @aricle.save
      flash[:success] = "Micropost created!"
      redirect_to root_path
    else
      render '/'
    end
  end

  def destroy
  end
end