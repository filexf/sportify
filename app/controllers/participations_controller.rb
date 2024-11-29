class ParticipationsController < ApplicationController
  def create
    @participation = Participation.new
    @participation.user = current_user
    @event = Event.find(params[:event_id])
    @participation.event = @event
    if @participation.save
      flash[:notice] = "Inscription réalisée avec succès !"
      redirect_to event_path(@event)
    else
      render :new, status: :unprocessable_entity
    end
  end
end
