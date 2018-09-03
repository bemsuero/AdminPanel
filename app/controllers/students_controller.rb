class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update, :destroy]
  before_action :find_user, only: [:new, :edit, :create]
  before_action :find_cohort, only: [:new, :edit]

  def new
    @student = Student.new
  end


  def create
    @cohort = Cohort.find_by(course_id: @user.id)
    until @cohort.students.count == @cohort.max_students do
    @student = Student.new(student_params)
    @student.cohort_id = @cohort.id
    @student.generate_student_id
    if @student.save
      msg = "New Student Created: #{@student.full_name}."
      flash[:notice] = msg
      redirect_to user_cohort_path(@user.id, @cohort.course_id) and return
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
        redirect_to user_cohort_path(@user.id, @cohort.course_id)
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



  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :birthdate, :education, :student_id, :user_id, :cohort_id)
  end

  def find_student
      @student = Student.find(params[:id])
    end

    def find_user
      @user = User.find_by(params[:user_id])
    end

    def find_cohort
      @cohort = Cohort.where(course_id: @user.id)
    end

end
