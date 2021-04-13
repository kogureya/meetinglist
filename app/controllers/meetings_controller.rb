class MeetingsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create, :show]

  def index
    @meeting = Meeting.all.order('date ASC').order('time ASC')
  end

  def new
    @meeting = Meeting.new
    @date = Date.today
  end

  def create
    @meeting = Meeting.new(meeting_params)
    if @meeting.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @meeting = Meeting.find(params[:id])
  end

  private
    def meeting_params
      params.require(:meeting).permit(:date, :time, :title, :client, :zoom_url).merge(user_id: current_user.id)
    end


end
