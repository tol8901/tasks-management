class Users::SessionsController < Devise::SessionsController
  skip_before_action :require_no_authentication

  def create
    self.resource = warden.authenticate!(auth_options)
    sign_in(resource_name, resource)
    render json: {
          message: 'You are logged in.',
          user: current_user
        }, status: :ok
  end

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def destroy
    respond_to_on_destroy
  end

  def log_out_success
    render json: { message: 'You are logged out.' }, status: :ok
  end

  def log_out_failure
    render json: { message: 'Hmm nothing happened.' }, status: :unauthorized
  end
end