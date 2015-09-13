module Api
  class FormSerializer < ActiveModel::Serializer 
    attributes :id, :title, :start_at, :finish_at, :description
    has_many :questions
  end
end
