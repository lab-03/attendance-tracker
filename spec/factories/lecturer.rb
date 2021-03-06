# == Schema Information
#
# Table name: lecturers
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
FactoryBot.define do
  factory :lecturer do
    user
    email { "#{Faker::Name.first_name}@fci-cu.edu.eg" }
  end
end
