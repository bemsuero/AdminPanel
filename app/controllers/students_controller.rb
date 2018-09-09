class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update, :destroy]
  before_action :find_user, only: [:new, :edit, :create, :index]
  before_action :find_courses_cohorts, only: [:new, :create]

  def new
    @student = Student.new
  end


  def create
    until @cohort.students.count == @cohort.max_students do
    @student = Student.new(student_params)
    @student.cohort_id = @cohort.id
    @student.course_id = @course.id
    @student.generate_student_id
    if @student.save
      msg = "New Student Created: #{@student.full_name}."
      flash[:notice] = msg
      redirect_to user_course_cohort_path(@user.id, @cohort.course_id, @cohort.id) and return
    else
      p @student.errors.messages
      render "new"
    end
  end
end

  def edit
  end

  def update
    if @student.update(student_params)
  p "Student successfuly updated"
        redirect_to user_course_cohort_path(@user.id, @cohort.course_id, @cohort.id)
else
  render "edit"
end
end

def destroy
  @student.destroy
  redirect_to students_index_path
end

  def index
    @students = Student.all
  end

  def show

  end

  def search
  end

  def results
    @results = params[:q]
    search_words = params[:q].downcase.split(' ')
    # you can chain methods with "enter" but why would you even do that.
    names = Student.pluck(:first_name)
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
          x = Student.where(first_name: match)
          x.each do |y|
            @final_results << y
          # end
      end
  end
  @final_results.uniq!
end


  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :birthdate, :phone, :education, :photo, :student_id)
  end

  def find_student
      @student = Student.find(params[:id])
    end

    def find_user
      @user = User.find_by(params[:user_id])
    end

    def find_courses_cohorts
      @course = Course.find(params[:course_id])
      @cohort = Cohort.find(params[:cohort_id])
    end

end
