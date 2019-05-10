class Chore < ApplicationRecord
  mount_uploader :chore_photo, ChorePhotoUploader
  validates :name, presence: true

  belongs_to :house
  belongs_to :user, optional: true
end
