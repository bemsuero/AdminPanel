class CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update, :destroy]
  before_action :find_user, only: [:new, :create, :edit, :show, :update]


  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user_id = @user.id
    if @course.save
      redirect_to user_path(@user) and return
    else
      p @course.errors.messages
      render "new" and return
    end
  end

  def edit
  end

  def update
   @course.update(course_params)
    p course_params
    @course.cohorts.each do |cohort|
    cohort.name = "#{@course.name}" + " " + "#{cohort.start.strftime("%B %Y")}"
  if cohort.save
  p cohort
  end
  p "Course successfuly updated"
  redirect_to user_path(@user) and return
else
  render "edit" and return
end
end


def destroy
  @course.destroy
  redirect_to allcourses_path
end

  def index
    @courses = Course.all
  end

  def show
  end

  private

  def course_params
    params.require(:course).permit(:name, :hours, :description)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_course
      @course = Course.find(params[:id])
    end

end
