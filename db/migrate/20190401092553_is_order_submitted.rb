class IsOrderSubmitted < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :is_order_submitted, :boolean, default: false
  end
end
