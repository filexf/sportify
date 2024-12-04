class PublicationsController < ApplicationController

  def index
    @publications = Publication.all
    @publication = Publication.new
    @comments = Comment.all
    @comment = Comment.new

  end

  def create
    # @comment = Comment.new
    # @comments = Comment.all
    # @publications = Publication.all

    @publication = Publication.new(publication_params)
    @publication.kind_of = "player_creation"
    @publication.user = current_user
    # @publication.comments = @comments
    @publication.save
    # @publication.comments = @comments
    # redirect_to publications_path
    # if @publication.save
    #   raise
    #   redirect_to publications_path
    # else
    #   render "publications/index", status: :unprocessable_entity
    # end
    #   respond_to do |format|
    #     format.turbo_stream do
    #       render turbo_stream: turbo_stream.prepend(:publications, partial: "publications/player_creation_card",
    #         target: "publications",
    #         locals: { publication: @publication })
    #     end
    #     format.html { redirect_to publications_path }
    #   end
    # else
    #   render "publications/index", status: :unprocessable_entity
    # end
  end

  private

  def publication_params
    params.require(:publication).permit(
      :title,
      :content,
      :sport,
      :kind_of,
      :photo, as: :file
    )
  end
end
