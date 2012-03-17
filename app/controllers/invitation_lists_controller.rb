class InvitationListsController < ApplicationController
  layout "invitation_list" 
  
  def temphome
    @invitation_list = InvitationList.new
  end
  
  def new
    @invitation_list = InvitationList.new(params[:invitation_list])
  end
  
  def create
    @invitation_list = InvitationList.new(params[:invitation_list])
    if @invitation_list.save
      flash[:success] = "Welcome to Printless!"
      redirect_to root_path
    else
      render 'new'
    end
  end
end
