class ChoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :due, :user, :chore_photo

  belongs_to :house
  belongs_to :user

end
