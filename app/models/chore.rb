class Chore < ApplicationRecord
  @statuses = ['unclaimed', 'claimed', 'complete']
  mount_uploader :chore_photo, ChorePhotoUploader
  validates :name, presence: true
  validates :status, :inclusion => { :in => @statuses }

  belongs_to :house
  belongs_to :user, optional: true
end
