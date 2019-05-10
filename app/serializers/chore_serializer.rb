class ChoreSerializer < ActiveModel::Serializer
  attributes :id, :name, :status, :due, :user

  belongs_to :house
  belongs_to :user

end
