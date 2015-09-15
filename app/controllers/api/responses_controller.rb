module Api
  class ResponsesController < ApplicationController
    
    def index
      @form = Form.includes(:questions).find(params[:form_id]) 
      @responses = Response.where(form_id: params[:form_id])
      respond_with data: { 
        responses: serialize_objects(@responses, Api::ResponseShortSerializer),
        form: serialize_object(@form, Api::FormSerializer)
      }
    end

    def show
      @response = Response.find(params[:id])
      respond_with @response
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
