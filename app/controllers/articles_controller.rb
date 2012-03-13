class ArticlesController < ApplicationController
  before_filter :signed_in_user, only: [:new, :create]
  before_filter :current_user, only: [:new, :create, :destroy]
  
 def index
    #@articles = Article.all
    @articles = Article.paginate(page: params[:page])
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.articles.build(params[:article])
  end

  def edit
     @article = Article.find(params[:id])
  end

  def create
    @article = current_user.articles.build(params[:article])
    if @article.save
      redirect_to @article
    else
      redirect_to root_path
    end
  end
  
    def update
      @article = Article.find(params[:id])
      if @article.update_attributes(params[:article])
        @article.save
        redirect_to @article
      else
      render 'edit'
    end
  end
  
  # Something doesnt work here #
  def destroy
    @article = Article.find(params[:id])
    if @article.user_id == current_user.id
      @article.destroy
      redirect_to user_path
    else
      @article.destroy
      redirect_to user_path
    end
  end
  
end
