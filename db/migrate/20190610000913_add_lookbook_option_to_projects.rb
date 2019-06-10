class AddLookbookOptionToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :is_lookbook, :boolean, default: false
  end
end
