class EventsController < ApplicationController
  def index
    # Render all events without filters
    @events = Event.all

    # Render all events near current user
    @near_events = Location
      .near(current_user, 10) # le 10 devrait être variabilisé ?
      # .flat_map { |location| location.events } idem que ligne suivante, marche pour tous les ittérateurs
      .flat_map(&:events)
      .map { |event| {
        name: event.name,
        coordinates: event.coordinates,
        info_event_html: render_to_string(partial: "info_event", locals: {event: event}),
        marker_html: render_to_string(partial: "marker", locals: {event: event})
      }}

    # Me localiser sur la carte
    @current_user = current_user
    # @user_marker = {
    #   lat: current_user.latitude,
    #   lng: current_user.longitude,
    #   # marker_user: render_to_string(partial: "marker", locals: {user: current_user})
    # }

  end
end
