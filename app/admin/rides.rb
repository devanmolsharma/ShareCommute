ActiveAdmin.register Ride do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :from, :to, :seats, :price_share, :user_id, :time, :active,:category_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:from, :to, :seats, :price_share, :user_id, :time, :active]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
