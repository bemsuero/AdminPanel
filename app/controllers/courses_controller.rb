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
      redirect_to user_course_path(@user.id, @course.id)
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
  cohort.save
  p cohort
  p @course.cohorts.count
end
  p "Course successfuly updated"
  redirect_to user_path(@user) and return
else
  render "edit" and return
end



def destroy
  respond_to do |format|
      format.js
    end
  @course.destroy
end

  def index
    @courses = Course.all
  end

  def show
  end

  def search
  end

  def results
    @results = params[:q]
    search_words = params[:q].downcase.split(' ')
    # you can chain methods with "enter" but why would you even do that.
    names = Course.pluck(:name)
    matches = []
    @final_results = []
    search_words.each do |word|
      names.each do |na|
        if na.downcase.include?(word)
          matches << na
        end
        end
      end
      matches.each do |match|
        # Article.all.each do |article|
          x = Course.where(name: match)
          x.each do |y|
            p @final_results
            @final_results << y
            p @final_results
          # end
      end
  end
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
