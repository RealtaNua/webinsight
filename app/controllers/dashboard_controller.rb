class DashboardController < ApplicationController

  layout "dashboard_template"

  before_action :authorize
  

  def index
  end
  
end
