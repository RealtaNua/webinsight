class SurveysController < ApplicationController


  layout "dashboard_template"

  before_action :set_survey, only: [:show, :edit, :update, :destroy]


   respond_to :json, :html

  # GET /surveys
  # GET /surveys.json
  def index
  
    @surveys = Survey.all
    # respond_with @surveys
    
    session[:survey_status] = ""
  end

  
  
  # GET /surveys/1
  # GET /surveys/1.json
  def show
    session[:survey_status] = ""
    #@questions = Question.find_by(survey_id: @survey.id)  	
    #@questions = Question.where(["survey_id = ?", @survey.id])
    
    if(params[:before_question_id])
    	question_array = Question.where(["survey_id = ? and before_question_id = ?", params[:id], params[:before_question_id] ])
    else
	   	question_array = Question.where(["survey_id = ? and before_question_id = ?", params[:id], "0"])
    end
    @question = question_array.first
	#@choices  = Choice.where(["question_id = ?", @question.id])
	
#    for question in @questions
#    	@choices = Choice.where(["question_id = ?", question.id])
#    end
    
  end
  
  def choices
     @choices = Choice.where(["question_id = ?", question.id])
  end
  
  helper_method :choices

  # GET /surveys/new
  def new
    @survey = Survey.new
  end

  # GET /surveys/1/edit
  def edit
    #render :text => "inside edit"
	#redirect_to edit_survey_path(params[:id])
  end




  # POST /surveys
  # POST /surveys.json
  def create
    @survey = Survey.new(survey_params)

   # respond_to do |format|
      if @survey.save
       # format.html { redirect_to @survey, notice: 'Survey was successfully created.' }
       # format.json { render :show, status: :created, location: @survey }
        
        session[:survey_status] = "survey created"

        #Call workflow action in applicationController
        surveyWorkflow

        #redirect_to :controller=>'questions',:action=>'new'
      else
        format.html { render :new }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    #end
  end

  def updatetheme
  	@survey = Survey.find(params[:id])
  	
  	if @survey.update(survey_params)
  		session[:survey_status] = "theme chosen"
  		
        #Call workflow action in applicationController
        surveyWorkflow  
          		
  	end
  end

  # PATCH/PUT /surveys/1
  # PATCH/PUT /surveys/1.json
  def update
    #respond_to do |format|
      if @survey.update(survey_params)
        #format.html { redirect_to @survey, notice: 'Survey was successfully updated.' }
        #format.json { render :show, status: :ok, location: @survey }
        
        if session[:survey_status] == "survey updated"
        	session[:survey_status] = "questions updated"
        elsif session[:survey_status] == ""
        	session[:survey_status] = "survey updated"
        end
        
        
        #Call workflow action in applicationController
        surveyWorkflow        
        
      else
        format.html { render :edit }
        format.json { render json: @survey.errors, status: :unprocessable_entity }
      end
    #end
  end

  # DELETE /surveys/1
  # DELETE /surveys/1.json
  def destroy
    
    @survey.destroy
    
   # respond_with @survey.destroy

    respond_to do |format|
      format.html { redirect_to surveys_url, notice: 'Survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey
      @survey = Survey.find(params[:id])
      @question = Question.find_by(survey_id: @survey.id)
      @choices = Choice.find_by(question_id: @question.id)
      #session['question_id'] = @question.id
      #session['choice_id'] = @choices.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_params
      params.permit(:theme_id, :description, :name, 
      questions_attributes: [:id, :description, :type_id])
    end
end
