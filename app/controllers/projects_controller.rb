class ProjectsController < ApplicationController
   before_filter :signed_in_user, only: [:new, :create]
   before_filter :current_user, only: [:new, :create, :destroy]

  def index
     #@articles = Article.all
     @projects = Project.paginate(page: params[:page])
   end

   def show
     @project = Project.find(params[:id])
   end

   def new
     @project = current_user.projects.build(params[:project])
   end

   def edit
      @project = Project.find(params[:id])
   end

   def create
     @project = current_user.projects.build(params[:project])
     if @project.save
       redirect_to @project
     else
       redirect_to root_path
     end
   end

     def update
       @project = Project.find(params[:id])
       if @project.update_attributes(params[:project])
         @project.save
         redirect_to @project
       else
       render 'edit'
     end
   end

   # Something doesnt work here #
   def destroy
     @project = Article.find(params[:id])
     if @project.user_id == current_user.id
       @project.destroy
       redirect_to user_path
     else
       @project.destroy
       redirect_to user_path
     end
   end

end
