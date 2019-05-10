class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  belongs_to :house, optional: true
  has_many :chores
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
