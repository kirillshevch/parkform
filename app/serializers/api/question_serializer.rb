module Api
  class QuestionSerializer < ActiveModel::Serializer 
    attributes :id, :title, :data, :question_type 
  end
end
