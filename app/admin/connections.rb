ActiveAdmin.register Connection do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :user_1, :user_2, :connection_status
  #
  # or
  #
  # permit_params do
  #   permitted = [:user_1_id, :user_2_id, :connection_status]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.inputs "Connection Details" do
    f.input :user_1
    f.input :user_2
    f.input :connection_status
    end
    f.actions
  end
  
end
