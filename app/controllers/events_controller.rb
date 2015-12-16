
class EventsController < ApplicationController
  before_action(:find_event, {only: [:show, :edit, :update, :destroy]})

  def new
    @event = Event.new
    @event.image = params[:file]
  end

  def create
    @event = Event.new event_params
    if @event.save
      redirect_to(event_path(@event), notice: "Event Created!")
    else
      render :new, alert: "An Error occured while creating the event"
    end
  end

  def index
    @events = Event.all.page(params[:page]).per(9)
  end

  def show
    @event = Event.find params[:id]
    @comment = Comment.new
  end


  def edit
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event), notice: "Event Updated!"
    else
      render :edit, alert: "An Error occured editing the event"
    end
  end

  def destroy
    @event.destroy
    flash[:notice] = "Events Deleted Successfully"
    redirect_to events_path
  end

  private

  def event_params
    event_params = params.require(:event).permit([:title, :body, :event_date, :image])
  end

  def find_event
    @event = Event.find params[:id]
  end

end
