module Api
  class ResponsesController < ApplicationController
    
    def index
      if params[:form_id]
        @form = Form.includes(:questions).find(params[:form_id]) 
        @responses = Response.where(form_id: params[:form_id])
        respond_with data: { 
          responses: serialize_objects(@responses, Api::ResponseShortSerializer),
          form: serialize_object(@form, Api::FormSerializer)
        }
      else
        @responses = Response.includes(:form)
        respond_with @responses, each_serializer: Api::ResponseSmallSerializer
      end
    end

    def show
      @response = Response.find(params[:id])
      @form = Form.includes(:questions).find(@response.form_id) 
      respond_with data: { 
        response: serialize_object(@response, Api::ResponseShortSerializer),
        form: serialize_object(@form, Api::FormSerializer)
      }
    end

    def create
      @response = Response.new form_id: response_params[:form_id], data: response_params[:data]
      @response.user = current_user
      if @response.save
        render json: { response: @response }
      end
    end

    private

    def response_params
      params.require(:response).permit!
    end

  end
end
