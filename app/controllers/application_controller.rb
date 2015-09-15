class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  respond_to :json

  private

  def serialize_objects(objects, serializer, options = {})
    options = options.merge({ each_serializer: serializer })
    ActiveModel::ArraySerializer.new(objects, options)
  end

  def serialize_object(object, serializer = nil)
    serializer ||= [object.class.name, 'Serializer'].join().constantize

    serializer.new(object).as_json(
      root: false,
      user: current_user
    )
  end
end
