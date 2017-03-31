class UsersController < ApplicationController

  include ApplicationHelper
  before_action :correct_user, only: [:show, :edit, :update, :destroy]

  def show
    @hosted_events=current_user.hosted_events
    @upcoming_events=current_user.attended_events.upcoming_events
    @past_events=current_user.attended_events.past_events

  end

  # GET /users/new
  def new
    @user = User.new
  end

   def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email)
    end

    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
