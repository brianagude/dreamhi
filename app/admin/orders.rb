ActiveAdmin.register Order do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :first_name, :last_name, :email, :address_1, :address_2, :unit, :city, :state, :country, :postal, :is_order_submitted, order_items_attributes: [:id, :product_id, :quantity]

index do
    selectable_column
    id_column
    column :name do |order|
      order.first_name + " " + order.last_name
    end
    column :email
    column :city
    column "Fulfilled", :is_order_submitted
    actions
  end

  form do |f|
    f.inputs do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :is_order_submitted, label: 'Has this order been fulfilled?'
    end
    f.inputs "Address" do
      f.input :address_1
      f.input :address_2
      f.input :city
      f.input :state
      f.input :postal
      f.input :country
    end

    f.has_many :order_items, heading: "Products" do |itemf|
      itemf.input :product
      itemf.input :quantity
    end


    f.actions
  end




end
