module Api
  class ResponseShortSerializer < ActiveModel::Serializer 
    attributes :id, :data, :created_at
    def data
      JSON.parse(object.data)
    end

    def created_at
      I18n.l(object.created_at.in_time_zone.to_date, format: :default)
    end
  end
end
