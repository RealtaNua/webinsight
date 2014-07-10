class SignupController < ApplicationController

  skip_before_action :authorize

  def index
  	@lead = Lead.new
  end
  
  def email
  	    @lead = Lead.new(:email => params['email'],:channel => params['channel'])
  	    @lead.save
  	    
  	    flash[:notice] = "Thanks, we'll keep you in the loop!"
  	    redirect_to action: 'index'
  end
  
end
