class EventsController < ApplicationController
  before_action :set_event, only: [:edit, :update, :destroy, :show]

  def index 
  end
  
  def new
  end

  def edit
  end

  def show
  end

  def create
  end

  def update
  end

  def destroy
  end

  def set_event
    @event = Event.find(params[:id])
  end
end
