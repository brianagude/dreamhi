ActiveAdmin.register Project do
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
permit_params :title, :image_1, :image_2, :image_3, :image_4, :image_5, :image_6, :image_7, :image_8, :image_9, :image_10, :description, :is_archived, :artist, :is_photography, :is_design, :is_team_member, :is_lookbook

index do
  selectable_column
  index_column
  column "Main Image" do |project|
    image_tag project.image_1.thumb.url, width: '50'
  end
  column :title
  column :artist
  column "Photography", :is_photography
  column "Design", :is_design
  column "Archived", :is_archived
  column "Team Member", :is_team_member
  column "Lookbook", :is_lookbook
  actions
end

form title: 'Project Info' do |f|
    inputs 'Details' do
      input :title
      input :artist
      input :description
      input :is_archived, label: 'Archive'
      input :is_photography, label: 'Photography'
      input :is_design, label: 'Design'
      input :is_team_member, label: 'Team Member'
      input :is_lookbook, label: 'Lookbook'
    end

    inputs 'Photos' do
      input :image_1
      input :image_2
      input :image_3
      input :image_4
      input :image_5
      input :image_6
      input :image_7
      input :image_8
      input :image_9
      input :image_10
    end

    para "Press cancel to return to the list without saving."
    actions
  end


end
