class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.string :image_4
      t.string :image_5
      t.text :description
      t.string :collection
      t.boolean :is_archived, default: false
      t.string :artist

      t.timestamps
    end
  end
end
