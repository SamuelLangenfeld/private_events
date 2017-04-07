class InvitationsController < ApplicationController
  before_action :invitation_params, only: [:create]
  before_action :delete_params, only: [:destroy]

  def create
    @invitation=Invitation.new
    @invitation.attendee_id= User.find_by_name(params[:invitation][:attendee_name]).id
    puts @invitation.attendee_id
    @invitation.event_id= Event.find(params[:invitation][:event_id]).id
    puts @invitation.event_id
    @invitation.save
    flash[:notice] = "Invitation accepted"
    redirect_to :back
  end

  def destroy
    @invitation=Invitation.find(params[:id])
    @invitation.delete
    flash[:notice] = "Invitation declined"
    redirect_to :back
  end

  

  private

  

  def invitation_params
    params.require(:invitation).permit(:attendee_name, :attendee_id, :event_id)
  end

  def delete_params
    params.require(:id)
  end

end