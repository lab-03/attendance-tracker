# == Schema Information
#
# Table name: lecturers
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
class Lecturer < ApplicationRecord
  include UserableLogic

  has_many :lecturer_courses
  has_many :courses, through: :lecturer_courses

  has_many :lecturer_course_groups
  has_many :course_groups, through: :lecturer_course_groups

  has_many :sessions

  validate :fci_mail

  after_create :confirm_user


  private

  def fci_mail
    if user&.email.nil? || (email =~ FCI_MAIL_LEC_REGEX).nil?
      errors.add(:email, "please enter a valid FCI-CU email")
      false
    else
      true
    end
  end

  def confirm_user
    user.confirm
  end
end
