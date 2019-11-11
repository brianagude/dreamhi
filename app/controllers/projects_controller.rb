class ProjectsController < ApplicationController
  def index
    
  end

  def show
    @project = Project.find(params[:id])
    @prev = Project.where("id < ?", params[:id]).order(:id).last
    @next = Project.where("id > ?", params[:id]).order(:id).first
  end

  def info
    @projects = Project.where(is_team_member: true)
  end

  # def projects
  #  @projects = Project.all
  # end

  def lookbook
    @projects = Project.where(is_lookbook: true)
  end

  def photography
    @projects = Project.where(is_photography: true)
  end

  def design
    @projects = Project.where(is_design: true)
  end

  def archives
    @projects = Project.where(is_archived: true)
  end

  def contact

  end

  def all
    @projects = Project.all
  end

end
