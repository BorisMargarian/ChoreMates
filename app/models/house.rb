class House < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :users, dependent: :destroy
  has_many :chores, dependent: :destroy
end
