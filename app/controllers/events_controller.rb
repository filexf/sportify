class EventsController < ApplicationController
  def index
    @events = Event.all
    return unless params[:query] # Early return

    search_results = Event.global_search(params[:query])
    if search_results.any?
      @events = search_results
    else
      @search_message = "Désolé, nous n'avons pas trouvé de résultat avec #{params[:query]}"
    end

  end

  def my_events
    @my_events = current_user.events_as_organiser
    @events_i_join = current_user.events_as_player
  end
  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @playgrounds = Playground.all
  end

  def create
    # @sport = Sport.find(params[:sport_id])
    # @location = Location.find(params[:location_id])
    @event = Event.new(event_params)
    @event.organisator = current_user
    if @event.save
      flash[:notice] = "Événement créé avec succès!"
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def search
    # # Mes events
    # @my_events = current_user.events_as_organiser + current_user.events_as_player

    # Render all events near current user
    @near_events = Location
      .near(current_user, 10) # le 10 devrait être variabilisé ?
      # .flat_map { |location| location.events } idem que ligne suivante, marche pour tous les ittérateurs
      .flat_map(&:events)

    @near_event_markers = @near_events.map { |event| {
        name: event.name,
        coordinates: event.coordinates,
        info_event_html: render_to_string(partial: "info_event", locals: {event: event}),
        marker_html: render_to_string(partial: "marker", locals: {event: event})
      }}

    @events = Event.all
    return unless params[:query] # Early return

    search_results = Event.global_search(params[:query])
    if search_results.any?
      @events = search_results
    else
      @search_message = "Désolé, nous n'avons pas trouvé de résultat avec #{params[:query]}"
    end
  end

  private

  def event_params
    params.require(:event).permit(
      :name,
      :start_at,
      :end_at,
      :description,
      :playground_id
    )
  end

end
