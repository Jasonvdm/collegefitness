class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  attr_accessible :name, :number, :carrier, :contact_pref, :is_admin
  attr_accessible :has_equipment, :equipment_owned, :number_path
  attr_accessible :current_level_difficulty

  def make_admin
    self.is_admin = true
    save
  end
end
