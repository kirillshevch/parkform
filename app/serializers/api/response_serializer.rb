module Api
  class ResponseSerializer < ActiveModel::Serializer 
    attributes :id, :form_id, :data
  end
end
