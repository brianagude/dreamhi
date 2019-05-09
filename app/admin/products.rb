ActiveAdmin.register Product do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :image_1, :image_2, :image_3, :image_4, :image_5, :price, :description,:is_sold_out

index do
  selectable_column
  index_column
  column "Main Image" do |product|
    image_tag product.image_1.thumb.url, width: '80'
  end
  column :title
  column :price
  column "Sold Out", :is_sold_out
  actions
end

form title: 'Product Info' do |f|
    inputs 'Details' do
      input :title
      input :price
      input :description
      input :is_sold_out, label: 'Is This Product Sold Out?'
    end

    inputs 'Photos' do
      input :image_1
      input :image_2
      input :image_3
      input :image_4
      input :image_5
    end

    para "Press cancel to return to the list without saving."
    actions
  end

end
