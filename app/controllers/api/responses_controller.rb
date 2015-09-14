module Api
  class ResponsesController < ApplicationController

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
