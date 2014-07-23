class TestwidgetsController < ApplicationController
  def index
    @survey = Survey.find(32)
  	
  	session[:survey_status] = ""
    
    if(params[:before_question_id])
    	question_array = Question.where(["survey_id = ? and before_question_id = ?", params[:id], params[:before_question_id] ])
    else
	   	question_array = Question.where(["survey_id = ? and before_question_id = ?", params[:id], "0"])
    end
    @question = question_array.first

  end
  
  
end
