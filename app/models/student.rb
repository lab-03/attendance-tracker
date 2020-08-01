# == Schema Information
#
# Table name: students
#
#  id         :bigint           not null, primary key
#  image_data :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint
#
class Student < ApplicationRecord
  include UserableLogic
  include ImageUploader::Attachment(:image)
  has_many :attendances

  has_many :course_group_students
  has_many :course_groups, through: :course_group_students
  has_many :courses, through: :course_groups

  validates :user, :image, :email, presence: true, on: :create
  validate :fci_mail
  validate :image_has_one_face, on: :create

  private

  def fci_mail
    if user&.email.nil? || (email =~ FCI_MAIL_REGEX).nil?
      errors.add(:email, "please enter a valid FCI-CU email")
      false
    else
      true
    end
  end

  def image_has_one_face
    return true if FaceRecognition.detect_no_of_faces_in_image(image.url) == 1
    errors.add(:image, 'the photo contains more than 1 face, please re take it with your face only.')
    false
  end

end

