class InvitationListsController < ApplicationController
  def new
    @invitation_list = InvitationLists.new
  end
  
  def create
    @invitation_list = InvitationLists.new(params[:invitation_list])
    if @invitation_list.save
      flash[:success] = "Welcome to Printless!"
      redirect_to root
    else
      render 'new'
    end
  end
end
