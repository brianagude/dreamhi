ActiveAdmin.register Project do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :image_1, :image_2, :image_3, :image_4, :image_5, :description, :is_archived, :artist, :photography, :design, :is_team_member

index do
  selectable_column
  index_column
  column "Main Image" do |project|
    image_tag project.image_1.thumb.url, width: '50'
  end
  column :title
  column :price
  column :artist
  column "Phorography", :photography
  column "Design", :design
  column "Archived", :is_archived
  column "Team Member", :is_team_member
  actions
end

form title: 'Project Info' do |f|
    inputs 'Details' do
      input :title
      input :artist
      input :description
      input :is_archived, label: 'Archive'
      input :photography, label: 'Photography'
      input :design, label: 'Design'
      input :is_team_member, label: 'Team Member'
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
