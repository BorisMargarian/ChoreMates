class ChoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :due, :chore_photo

  belongs_to :house
  belongs_to :user

end
