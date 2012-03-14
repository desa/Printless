class CommentsController < ApplicationController
  
  def index
    @commentable = find_commentable
    @comments = @commentable.comments
  end
  
  def show
    @comment = Comment.find(params[:id])
  end

  def new
   @comment = Comment.new
  end

  def edit
     @comment = Comment.find(params[:id])
     redirect_to @comment unless current_user.id == @comment.user_id
  end

  def create
    @commentable = find_commentable
    @comment = @commentable.comments.build(params[:comment])
    if @comment.save
      redirect_to @commentable
    else
      redirect_to root_path
    end
  end
  
    def update
      @comment = Comment.find(params[:id])
      if @comment.update_attributes(params[:comment])
        @comment.save
        redirect_to @comment
      else
      render 'edit'
    end
  end
  
  # Something doesnt work here #
  def destroy
    @comment = Comment.find(params[:id])
    if @comment.user_id == current_user.id
      @comment.destroy
      redirect_to user_path
    else
      @comment.destroy
      redirect_to user_path
    end
  end
  
  private
  
  def find_commentable
    params.each do |name, value|
      if name =~ /(.+)_id$/
        return $1.classify.constantize.find(value)
      end
    end
    nil
  end
end
