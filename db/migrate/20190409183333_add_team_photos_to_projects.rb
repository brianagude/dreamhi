class AddTeamPhotosToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :is_team_member, :boolean, default: false
  end
end
