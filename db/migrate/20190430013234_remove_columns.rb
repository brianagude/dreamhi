class RemoveColumns < ActiveRecord::Migration[5.2]
  def change
    remove_column :order_items, :color
    remove_column :products, :is_featured
    remove_column :products, :collection_date
    remove_column :products, :size
    remove_column :products, :color
    remove_column :projects, :photography
    remove_column :projects, :design
  end
end
