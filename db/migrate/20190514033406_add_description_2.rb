class AddDescription2 < ActiveRecord::Migration[5.2]
  def change
    add_column :products, :description_2, :text
  end
end
