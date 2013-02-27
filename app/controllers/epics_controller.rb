class EpicsController < ApplicationController
  before_filter :authenticate_user!

  expose :epic
  respond_to :html

  def index
    @epics = @project.epics.decorate
    respond_with @project, @epics
  end

  def show
    @epic = @project.epics.find(params[:id]).decorate
    respond_with @project, @epic
  end

  def edit
    @epic = @project.epics.find(params[:id])
    respond_with @project, @epic
  end

  def new
    @epic = @project.epics.new
    respond_with @project, @epic
  end

  def create
    @epic = @project.epics.new(params[:epic])
    @epic.author = current_user
    flash[:notice] = 'Epic created' if @epic.save
    respond_with @project, @epic
  end

  def update
    @epic = @project.epics.find(params[:id])
    if @epic.update_attributes(params[:epic])
      flash[:notice] = 'Epic updated'
    end
    respond_with @project, @epic
  end

  def destroy
    @epic = @project.epics.find(params[:id])
    flash[:notice] = 'Epic destroyed' if @epic.destroy
    respond_with @project, @epic
  end
end
