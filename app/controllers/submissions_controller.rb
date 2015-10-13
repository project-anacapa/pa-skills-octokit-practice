class SubmissionsController < ApplicationController
  before_action :set_course
  before_action :set_project
  before_action :set_submission, only: [:show, :edit, :update, :destroy]


  # GET /submissions
  # GET /submissions.json
  def index
    @submissions = @project.submissions.all
  end

  # GET /submissions/1
  # GET /submissions/1.json
  def show
  end

  # GET /submissions/new
  def new
    @sumbission = @submission.new
  end

  # GET /submissions/1/edit
  def edit
  end

  # POST /submissions
  # POST /submissions.json
  def create
    @sumbission = @submission.new(submission_params)
    #todo create a new submission record on github
    #@project = @course.submissions.new(project_params)

    respond_to do |format|
      if @submission.save
        format.html { redirect_to [@course, @project], notice: 'Submission was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /submissions/1
  # PATCH/PUT /submissions/1.json
  def update
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to course_project_submission_url(@course, @project, @submission), notice: 'Submission was successfully updated.' }
        format.json { render :show, status: :ok, location: @sumbission }
      else
        format.html { render :edit }
        format.json { render json: @sumbission.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /submissions/1
  # DELETE /submissions/1.json
  def destroy
    @submission.destroy
    respond_to do |format|
      format.html { redirect_to course_project_url, notice: 'Submission was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:course_id])
    end
    def set_project
      @project = @course.projects.find(params[:project_id])
    end
    def set_submission
      @project = @project.submissions.find(params[:id])
    end


    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params.require(:project).permit(:name,:github_repo,:github_owner)
    end
end
