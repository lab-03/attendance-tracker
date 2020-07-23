class UserSerializer < ActiveModel::Serializer
  attributes :first_name, :last_name, :image , :email, :userable_type, :userable_id
end
