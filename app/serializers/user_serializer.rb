class UserSerializer
  include FastJsonapi::ObjectSerializer
  attributes :first_name, :last_name, :image , :email, :userable_type, :userable_id
end
