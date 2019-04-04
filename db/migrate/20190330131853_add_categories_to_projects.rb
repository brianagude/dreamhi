class AddCategoriesToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :photography, :boolean, default: false
    add_column :projects, :design, :boolean, default: false
  end
end
