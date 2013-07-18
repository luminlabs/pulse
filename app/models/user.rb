class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  attr_accessible :name,:email,:twitter,:linkedin,:status,:instructor, :password, :password_confirmation, :remember_me
  attr_accessor :status
  has_many :rosters
  has_many :lectures, through: :rosters

end
