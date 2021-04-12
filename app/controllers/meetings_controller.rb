class MeetingsController < ApplicationController

  def index
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

  private
    def meeting_params
      params.require(:meeting).permit(:date, :time, :title, :client, :zoom_url).merge(user_id: current_user.id)
    end


end
