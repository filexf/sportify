class EventsController < ApplicationController
  def index
    # Render all events without filters
    @events = Event.all

    # Render markers for all events
    # Récupérer pour chaque event sa localisation
    events_infos = []
    @events.each do |event|
      event_info = {
        lat: event.playground.location.latitude,
        lng: event.playground.location.longitude,
        info_event_html: render_to_string(partial: "info_event", locals: {event: event}),
        marker_html: render_to_string(partial: "marker", locals: {event: event})
      }
      events_infos << event_info
    end
    @markers = events_infos

    # Les évènements autour de moi
      # Me localiser
      @user_marker = {
        lat: current_user.latitude,
        lng: current_user.longitude,
        # marker_user: render_to_string(partial: "marker", locals: {user: current_user})
      }
      # Récupérer les évènements -> @events

      # Faire un near "me" à "x" km près sur les events
  end

  def show
    @event = Event.find(params[:id])
    
  end
end
