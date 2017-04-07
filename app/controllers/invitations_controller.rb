class InvitationsController < ApplicationController
  before_action :invitation_params

  def create
    @invitation=Invitation.new
    begin 
      @invitation.attendee_id= User.find_by_name(params[:invitation][:attendee_name]).id
    rescue NoMethodError
      flash[:error] = "Could not find user. Check to make sure you have the right name"
    end
    @invitation.event_id= Event.find(params[:invitation][:event_id]).id
    @invitation.accepted= false
    if @invitation.save
      flash[:notice] = "Invitation created"
    else
      flash[:error] ||= "Error. Invitation could not be created."
    end
    redirect_to :back
  end

  def destroy
    @invitation=Invitation.find(params[:id])
    @invitation.delete
    flash[:notice] = "Invitation declined"
    redirect_to :back
  end

  def accepted
    @invitation=Invitation.find(params[:invitation][:id])
    @invitation.accepted= true
    @invitation.save
    flash[:notice] = "Invitation accepted"
    redirect_to :back
    
  end

  

  private

  

  def invitation_params
    params.require(:invitation).permit(:attendee_name, :attendee_id, :event_id, :id)
  end

end