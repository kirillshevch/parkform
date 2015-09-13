module Api
  class QuestionsController < ApplicationController
    def index
      @questions = Question.where(form_id: params[:form_id])
      respond_with @questions
    end
  end
end
