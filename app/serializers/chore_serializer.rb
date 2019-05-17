class ChoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :due, :chore_photo, :cost, :description

  belongs_to :house
  belongs_to :user

end
