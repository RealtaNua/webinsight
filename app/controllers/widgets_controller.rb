class WidgetsController < ApplicationController
  
  skip_before_action :authorize

  
  def index
  end
  
  def show
  	@survey = Survey.find(64)
  	params[:id] = @survey.id
  	session[:survey_status] = ""
    
    if(params[:type_id] == "2")
    	@response = Response.create(:choice_id => params[:choice_id],:content => params[:response_content])
    end
    
    
    if(params[:choice_id])
    	@choice = Choice.find(params[:choice_id])
    	if @choice.next_action == "question"		
	    	question_array = Question.where(["survey_id = ? and id = ?", params[:id], @choice.next_action_id ])
	    else 
	    	# Default option
	    	question_array = Question.where(["id = ?", "29"])
	    end
	    
	    if @choice.next_action == "url"
	    	@url = Url.find(@choice.next_action_id)
	    else
	    	@url = nil
	    end    
    else
	   	question_array = Question.where(["survey_id = ? and before_question_id = ?", params[:id], "0"])
    end
    
    @question = question_array.first

	if(@question.description.include? "%NAME%")
		@question.description = @question.description.gsub(/%NAME%/,params[:response_content])
		@response_content_1 = params[:response_content]
	end

	if(!@widget_url_array)
	    @widget_url_array = session[:widget_url_array]
	end
	
	if (@question.before_question_id == 0)
		session[:widget_urls] = nil
		session[:counter] = 0
		@widget_url_array = Array.new()
	end
	
		
	session[:widget_urls] ||= {}
	
	if(@widget_url_array.include? request.original_url)
		session[:counter] = session[:counter].to_i - 1
	else
		@widget_url_array.push(request.original_url)
		#session[:widget_urls][session[:counter].to_i] = request.original_url
		session[:counter] = session[:counter].to_i + 1
		session[:widget_url_array] = @widget_url_array
	end
  end
end
