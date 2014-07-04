class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  layout "dashboard_template"

   respond_to :json, :html

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
    respond_with @questions
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
    #@choice = Choice.new
    #@survey = Survey.find(params[:survey_id])
    
    if @survey
       @question.survey_id = @survey.id
    else
       raise 'Survey ID not found! Did you create a survey first?'
    end
    
    choice = @question.choices.build
  end

  # GET /questions/1/edit
  def edit
  	@questions = @survey.questions
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)
	
    #respond_to do |format|
      if @question.save
        #format.html { redirect_to @question, notice: 'Question was successfully created.' }
        #format.json { render :show, status: :created, location: @question }
        
        session[:survey_status] = "questions created"
                
        #Call workflow action in applicationController
        surveyWorkflow
      
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    #end
  end


  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
  	questions_saved = true
  	@questions.each do |question|
  		@question = Question.find(question[:id])
  		question_saved = @question.update(question)
  		
  		if !(question_saved)
  			questions_saved = false
  		end
	end
  	
    #respond_to do |format|
      if questions_saved
        #format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        #format.json { render :show, status: :ok, location: @question }

		session[:survey_status] = "questions updated"
				
		#Call workflow action in applicationController
		surveyWorkflow
		
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    #end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question

      if !params[:survey_id].nil?
      	@question = Question.find_by(survey_id: params[:survey_id])
      elsif !params[:id].nil?
      	@question = Question.find(params[:id])
      	params[:survey_id] = @question.survey_id      	
      end
      
      @survey = Survey.find(params[:survey_id])
      #@choices = Choice.where(["question_id = ?", @question.id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:survey_id, :type_id, :description, 
      choices_attributes: [:id, :description])
    end
end
