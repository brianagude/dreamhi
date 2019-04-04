class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :address_1
      t.string :address_2
      t.string :unit
      t.string :city
      t.string :state
      t.string :postal
      t.string :country

      t.timestamps
    end
  end
end
