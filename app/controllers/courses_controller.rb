class CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update, :destroy]
  before_action :find_user, only: [:new, :create, :edit]


  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    @course.user_id = @user.id
    if @course.save
      redirect_to user_course_path(@course.user_id, @course)
    else
      p @course.errors.messages
      render "new"
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
  p "Course successfuly updated"
  redirect_to user_course_path(@course.user_id, @course)
else
  render "edit"
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
    params.require(:course).permit(:name, :hours, :description, :user_id)
  end

  def find_user
    @user = User.find(params[:user_id])
  end

  def find_course
      @course = Course.find(params[:id])
    end

end
