# frozen_string_literal: true

class EventsController < ApplicationController
  def show
    event
  end

  def index
    @events = Event.all
    @future_events = Event.future
  end

  def edit
    event
  end

  def update
    Event.update(event_params)
    redirect_to events_path
  end

  def new
    @event = Event.new
  end

  def destroy
    event.destroy
    redirect_to events_path
  end

  def create
    p event_params
    @event = Event.new(event_params)
    @event.author = current_user
    if @event.save
      redirect_to events_path
    else
      render 'new'
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :id, :title, :text, :start_time, :end_time, :user_id, :photo
    )
  end

  def event
    @event ||= Event.find(params[:id])
  end
end
