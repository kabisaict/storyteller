class ApplicationController < ActionController::Base
  before_filter :find_project

  extend Exposure
  expose :project

  protect_from_forgery

  private

  def find_project
    if params[:project_id]
      @project = Project.find(params[:project_id])
    end
  end
end
