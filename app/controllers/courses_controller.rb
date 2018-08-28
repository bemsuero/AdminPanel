class CoursesController < ApplicationController
  before_action :find_course, only: [:show, :edit, :update, :destroy]

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      redirect_to @course
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
  redirect_to @course
else
  render "edit"
end
end

def destroy
  @course.destroy
  redirect_to "/"
end

  def index
    @courses = Course.all
  end

  def show

  end

  private

  def course_params
    params.required(:course).permit(:name, :hours, :description)
  end

  def find_course
      @course = Course.find(params[:id])
    end

end
