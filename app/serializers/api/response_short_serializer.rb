module Api
  class ResponseShortSerializer < ActiveModel::Serializer 
    attributes :id, :data
    def data
      JSON.parse(object.data)
    end
  end
end
