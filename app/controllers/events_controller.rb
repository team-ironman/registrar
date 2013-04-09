class EventsController < ApplicationController

  def show
    @event = Event.find(params[:id])
    render :show, :layout => false
  end

end