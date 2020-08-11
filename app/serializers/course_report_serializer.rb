class CourseReportSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at

  has_many :sessions, serializer: SessionReportSerializer


end