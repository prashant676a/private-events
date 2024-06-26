class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = current_user.created_events.build(event_params)
    if @event.save
      flash[:notice] = "Event created successfully."
      redirect_to @event
    else
      render :new
    end

    private

    def event_params
      params.require(:event).permit(:name, :description, :date, :location)
    end
  end

  def show
    @event = Event.find(params[:id])
  end

end
