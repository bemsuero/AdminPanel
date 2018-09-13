class CohortsController < ApplicationController
  before_action :find_cohort, only: [:edit, :show, :update, :destroy]
  before_action :find_user, only: [:new, :show, :edit, :create, :update]
  before_action :find_course, only: [:new, :create, :show]

  def new
    @cohort = Cohort.new
  end


  def create
    @cohort = Cohort.new(cohort_params)
    @cohort.course_id = @course.id
    @cohort.user_id = @user.id
    @cohort.name = "#{@course.name}" + " " + "#{@cohort.startdate.strftime("%B %Y")}"
    @cohort.description = "#{@course.description}"
    if @cohort.save
      msg = "New Cohort Created: #{@cohort.name}."
      flash[:notice] = msg
      redirect_to user_course_cohort_path(@user.id, @course.id, @cohort.id)
    else
      p @cohort.errors.messages
      render "new"
    end
  end

  def edit
  end

  def update
    @course = Course.find(params[:id])
  if @cohort.update(cohort_params)
    @cohort.name = "#{@course.name}" + " " + "#{@cohort.startdate.strftime("%B %Y")}"
    if @cohort.save
  p "Cohort successfuly updated"
  redirect_to user_course_path(@user.id, @course.id)
else
  render "edit"
end
end
end

def destroy
  respond_to do |format|
      format.js
    end
  @cohort.destroy
end

  def index
    @cohorts = Cohort.all
    @cohort = Cohort.find_by(params[:cohort_id])
  end

  def show
  end

  def search
  end

  def results
    @results = params[:q]
    search_words = params[:q].downcase.split(' ')
    # you can chain methods with "enter" but why would you even do that.
    names = Cohort.pluck(:name)
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
          x = Cohort.where(name: match)
          x.each do |y|
            p @final_results
            @final_results << y
            p @final_results
          # end
      end
  end
end


  private

  def cohort_params
    params.require(:cohort).permit(:name, :startdate, :enddate, :max_students, :description)
  end

  def find_cohort
    @cohort = Cohort.find(params[:id])
    end

    def find_user
      @user = User.find(params[:user_id])
    end

    def find_course
      @course = Course.find(params[:course_id])
    end

end
