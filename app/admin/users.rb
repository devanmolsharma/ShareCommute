ActiveAdmin.register User do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :full_name, :phone, :email, :verified, :address, :public,:password,:password_confirmation,:profile_image,:province
  #
  # or
  #
  # permit_params do
  #   permitted = [:full_name, :phone, :email, :verified, :address, :public]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  remove_filter :profile_image_blob
  remove_filter :profile_image_attachment
  remove_filter :connections
  remove_filter :plans

  form do |f|
    f.inputs "User Details" do
    f.input :profile_image, as: :file
    f.input :full_name
    f.input :phone
    f.input :email
    f.input :verified
    f.input :address
    f.input :province
    f.input :public
    f.input :password
    f.input :password_confirmation
    end
    f.actions
  end
  
end
