class Api::V1::RegistrationsController < Devise::RegistrationsController

  skip_before_filter :verify_authenticity_token
  before_action :configure_permitted_parameters, if: :devise_controller?


  def create
    build_resource(sign_up_params)
    resource.skip_confirmation!
    if resource.save
      sign_in(resource, :store => false)
      render :status => 200,
            :json => { :success => true,
                      :info => "Registered",
                      :data => { :user => resource,
                                 :auth_token => current_user.authentication_token } }
    else
      render :status => :unprocessable_entity,
             :json => { :success => false,
                        :info => resource.errors,
                        :data => {} }
    end
  end


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :email])
  end

end
