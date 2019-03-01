class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :notes
end
