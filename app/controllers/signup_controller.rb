class SignupController < ApplicationController

  skip_before_action :authorize

  def index
  	@lead = Lead.new
  end
  
  def email
  	    @lead = Lead.new(:email => params['email'],:channel => params['channel'])
  	    if @lead.save
  	    	flash[:notice] = "Thanks, we'll keep you in the loop!"
  	    	redirect_to '/thanks-for-signing-up'
  	    else
  	    	flash[:error] = "Sorry, your email address is either invalid or already with us"
  	    	redirect_to '/'
  	    end
  end
  
end
