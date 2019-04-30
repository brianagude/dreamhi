class ProjectsController < ApplicationController
  def index
    @projects = Project.all
    @photography = params[:is_photography]
    @design = params[:is_design]
    @archive = params[:is_archived]

    if @design.present?
      @projects = Project.where(is_design: true)
    end

    if @photography.present?
      @projects = Project.where(is_photography: true)
    end

    if @archive.present?
      @projects = Project.where(is_archived: true)
    end

  end

  def show
    @project = Project.find(params[:id])
    @prev = Project.where("id < ?", params[:id]).order(:id).last
    @next = Project.where("id > ?", params[:id]).order(:id).first
  end

  def info
    @projects = Project.where(is_team_member: true)
  end

end
