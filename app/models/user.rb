class User < ApplicationRecord
  has_one :worker
  after_create :setup_worker

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  def setup_worker
    Worker.create( {
                               first_name: name.split(' ')[0],
                               last_name: name.split(' ')[1],
                               age: 100,
                               role: "Developer",
                               active: true,
                               user_id: id
                             } )
  end
end
