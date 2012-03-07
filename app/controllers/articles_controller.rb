class ArticlesController < ApplicationController
  #before_filter :signed_in_user, only: [:new, :create, :destroy]
  #before_filter :current_user, only: [:new, :create, :destroy]
  
 def index
    @article = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = current_user.articles.build(params[:article])
  end

  def edit
    @article = current_user.articles.build(params[:article])
  end

  def create
    @article = current_user.articles.build(params[:article])
    if @article.save
      redirect_to articles_path
    else
      redirect_to root_path
    end
  end
  
  ####NEED TO FIX THIS PART####
  
   # def update
    #  @article = Article.find(params[:id])
     # if @article.update_attributes(params[:article])
      #  @article.save
       # redirect_to @article
      #else
      #render 'edit'
    #end
  #end
  #def destroy
   # @article = Article.find(params[:id])
  #  @article.destroy
  #end
  
end
