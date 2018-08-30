class StudentsController < ApplicationController
  before_action :find_student, only: [:show, :edit, :update, :destroy]
  before_action :find_user, only: [:new, :edit, :create]

  def new
    @student = Student.new
    @course = Course.where(user_id: @user.id)
  end


  def create
    @student = Student.new(student_params)
    @student.user_id = @user.id
    @student.generate_student_id
    if @student.save
      msg = "New Student Created: #{@student.full_name}."
      flash[:notice] = msg
      redirect_to user_path(@student.user_id)
    else
      p @student.errors.messages
      render "new"
    end
  end

  def edit
  end

  def update
    if @student.update(student_params)
  p "Student successfuly updated"
  redirect_to user_path(@student.user_id)
else
  render "edit"
end
end

def destroy
  @student.destroy
  redirect_to root_path
end

  def index
    @students = Student.all
  end

  def show

  end



  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :birthdate, :education, :student_id, :user_id, :course_id)
  end

  def find_student
      @student = Student.find(params[:id])
    end

    def find_user
      @user = User.find(params[:user_id])
    end

end
