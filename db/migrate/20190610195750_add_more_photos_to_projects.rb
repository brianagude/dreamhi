class AddMorePhotosToProjects < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :image_6, :string
    add_column :projects, :image_7, :string
    add_column :projects, :image_8, :string
    add_column :projects, :image_9, :string
    add_column :projects, :image_10, :string
  end
end
