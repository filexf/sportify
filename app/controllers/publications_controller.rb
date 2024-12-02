class PublicationsController < ApplicationController
  

  def index
    @publications = Publication.all
    @publication = Publication.new

  end

  def create
    @publication = Publication.new(publication_params)
    @publication.user = current_user
    @publication.save
    redirect_to publications_path
  end

  private

  def publication_params
    params.require(:publication).permit(
      :title,
      :content,
      :sport,
      :photo
    )
  end
end
