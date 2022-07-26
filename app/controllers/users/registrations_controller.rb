class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    @worker = Worker.create( {
                               first_name: current_user.name.split(' ')[0],
                               last_name: current_user.name.split(' ')[1],
                               age: 20,
                               role: "Developer",
                               active: true
                             } )
    if @worker.save
      render json: {
        message: 'Signed up successfully.',
        user: current_user,
        message: 'Worker created successfully.',
        worker: @worker
      }, status: :ok
    else
      render json: {
        message: "Worker can not be saved",
        message: "#{@worker.errors.full_messages}"
      }
    end

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