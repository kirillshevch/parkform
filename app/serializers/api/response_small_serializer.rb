module Api
  class ResponseSmallSerializer < ActiveModel::Serializer 
    attributes :id, :form_id, :title
    def title
      object.form.title
    end
  end
end
