class ArticlesController < ApplicationController
  before_filter :signed_in_user, only: [:create, :destroy]
  
  def create
    @article = current_user.article.build(params[:article])
    if @article.save
      flash[:success] = "Article created!"
      redirect_to root_path
    else
      render root_path
    end
  end
  
  def destroy
  end
end
