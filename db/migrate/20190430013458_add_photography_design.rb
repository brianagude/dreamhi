class AddPhotographyDesign < ActiveRecord::Migration[5.2]
  def change
    add_column :projects, :is_design, :boolean, default: false
    add_column :projects, :is_photography, :boolean, default: false
  end
end
