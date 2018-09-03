class CohortsController < ApplicationController
  before_action :find_cohort, only: [:edit, :show, :update, :destroy]
  before_action :find_user, only: [:new, :show, :edit, :create, :update]
  before_action :find_course, only: [:new, :show, :edit, :create, :update]

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
      redirect_to user_course_path(@user.id, @course.id)
    else
      p @cohort.errors.messages
      render "new"
    end
  end

  def edit
  end

  def update
  if @cohort.update(cohort_params)
    @cohort.name = "#{@course.name}" + " " + "#{@cohort.start.strftime("%B %Y")}"
    @cohort.save
  p "Cohort successfuly updated"
  redirect_to user_course_path(@user.id, @course.id)
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
      @user = User.find_by(params[:user_id])
    end

    def find_course
      @course = Course.find_by(params[:course_id])
    end

end
