module Api
  class FormsController < ApplicationController
    respond_to :json

    def index
      @forms = Form.all
      respond_with @forms, each_serializer: FormShortSerializer
    end

    def show
      @form = Form.includes(:questions).find(params[:id]) 
      respond_with @form
    end
  end
end
