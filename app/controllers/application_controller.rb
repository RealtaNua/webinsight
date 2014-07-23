class ApplicationController < ActionController::Base
  before_action :authorize
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  after_filter :set_csrf_cookie_for_ng
  def set_csrf_cookie_for_ng
    cookies['XSRF-TOKEN'] = form_authenticity_token if protect_against_forgery?
  end


  protected

    def verified_request?
      super || form_authenticity_token == request.headers['X-XSRF-TOKEN']
    end

    def authorize
      unless User.find_by(id: session[:user_id])
         redirect_to login_url, notice: "Please Log In"
      end
    end

  # Path for survey workflow
  def surveyWorkflow
    survey_status = session[:survey_status]
    
    case survey_status
    when "survey created"
       redirect_to :controller=>'questions',:action=>'new',:survey_id=> @survey.id
    when "questions created"
       redirect_to :controller=>'surveys',:action=>'show',:id=> @survey.id,:notice=>'Great! Your Survey is Created!'
    when "survey updated"
    	redirect_to :controller=>'questions',:action=>'edit',:survey_id=> @survey.id
	when "questions updated"
		redirect_to :controller=>'themes',:action=>'index', :id=> @survey.id
	when "theme chosen"
		redirect_to :controller=>'surveys',:action=>'show',:id=> @survey.id	, :survey => @survey	
    end
    
  end



end
