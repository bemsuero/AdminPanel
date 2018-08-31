class CohortsController < ApplicationController
  before_action :find_cohort, only: [:show, :edit, :update, :destroy]
  before_action :find_user, only: [:new, :edit, :create, :update]
  before_action :find_course, only: [:new, :edit, :create, :update]

  def new
    @cohort = Cohort.new
  end


  def create
    @cohort = Cohort.new(cohort_params)
    @cohort.course_id = @course.id
    @cohort.name = "#{@course.name}" + " " + "#{@cohort.start.strftime("%B %Y")}"
    @cohort.description = "#{@course.description}"
    if @cohort.save
      msg = "New Cohort Created: #{@cohort.name}."
      flash[:notice] = msg
      redirect_to user_path(@cohort.course_id)
    else
      p @cohort.errors.messages
      render "new"
    end
  end

  def edit
  end

  def update
    @cohort.name = "#{@course.name}" + " " + "#{@cohort.start.strftime("%B %Y")}"
    if @cohort.update(cohort_params)
  p "Cohort successfuly updated"
  redirect_to user_path(@cohort.course_id)
else
  render "edit"
end
end

def destroy
  @cohort.destroy
  redirect_to cohorts_index_path
end

  def index
    @cohorts = Cohort.all
  end

  def show

  end



  private

  def cohort_params
    params.require(:cohort).permit(:name, :start, :end, :max_students, :description)
  end

  def find_cohort
      @cohort = Cohort.find(params[:id])
    end

    def find_user
      @user = User.find(params[:user_id])
    end

    def find_course
      @course = Course.find_by(user_id: @user.id)
    end

end
