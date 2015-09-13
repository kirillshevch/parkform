module Api
  class FormShortSerializer < ActiveModel::Serializer 
    attributes :id, :title
  end

  class FormSerializer < FormShortSerializer
    attributes :id, :title, :start_at, :finish_at, :description
    has_many :questions
  end

end
