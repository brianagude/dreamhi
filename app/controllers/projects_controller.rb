class ProjectsController < ApplicationController
  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
    @prev = Project.where("id < ?", params[:id]).order(:id).last
    @next = Project.where("id > ?", params[:id]).order(:id).first
  end

  def info
    @team = Project.where(is_team_member: true)
  end

  def design
    @projects = Project.where(design: true)
  end

  def photography
    @projects = Project.where(photography: true)
  end

  def archives
    @projects = Project.where(is_archived: true)
  end

end
