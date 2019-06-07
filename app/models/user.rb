class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  
  belongs_to :house, optional: true
  has_many :chores
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
