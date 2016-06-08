class EventsController < ApplicationController
  def index
    @events = Event.group(:user)
  end

  def show
    @name = params[:id]
    @user = params[:user]
    @event = Event.where("name = ? and user =? ",@name, @user)
  end
end
