class CompletionsController < ApplicationController
  def create
    @story = project.stories.find(params[:story_id])
    @story.complete
    redirect_to @story, notice: 'Story marked as ready'
  end
end
