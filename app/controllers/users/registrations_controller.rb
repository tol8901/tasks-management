class Users::RegistrationsController < Devise::RegistrationsController

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    @worker = Worker.create()
    @worker.first_name = current_user.name.split(' ')[0]
    @worker.last_name = current_user.name.split(' ')[1]

    render json: {
      message: 'Signed up successfully.',
      user: current_user,
      message: 'Worker created successfully',
      worker: @worker
    }, status: :ok
  end

  def register_failed
    render json: { message: 'Something went wrong.' }, status: :unprocessable_entity
  end

  # from FreeCodeCamp:
  def sign_up_params
    params.require(:user).permit( :name,
                                  :email,
                                  :password,
                                  :password_confirmation)
  end

  def account_update_params
    params.require(:user).permit( :name,
                                  :email,
                                  :password,
                                  :password_confirmation,
                                  :current_password)
  end
end