class EventsController < ApplicationController
  def index
    @events = Event.all 
    @past_events = Event.past
    @future_events = Event.future
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find params[:id]
  end

  def create
    @event = Event.new(event_params)

    if @event.save
      flash['notice'] = "Event created successfully."
      redirect_to root_path
    else
      flash.now['alert'] = "Event couldn't be created"
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    debugger
    @event = Event.find params[:id]
  end

  def update
    debugger
    @event = Event.find params[:id]

    if @event.update(event_params)
      flash[:notice] = "Event updated successfully."
      redirect_to event_path(@event)
    else
      flash.now[:error] = "couldn't be updated"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:date,:title,:user_id)
    .with_defaults(user_id:current_user.id)
  end

end
