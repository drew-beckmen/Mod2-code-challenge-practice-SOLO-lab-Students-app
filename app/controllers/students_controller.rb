class StudentsController < ApplicationController
  before_action :get_student, only: [:show, :edit, :update]
  before_action :get_instructors, only: [:new, :edit]
  def index
    @students = Student.all
  end

  def new 
    @student = Student.new 
  end 

  def create 
    student = Student.new(student_params)
    if student.valid? 
      student.save 
      redirect_to student_path(student)
    else 
      flash[:errors] = student.errors.full_messages
      redirect_to '/students/new'
    end 
  end

  def show 
  end 

  def edit 
  end 

  def update 
    @student.attributes = student_params 
    if @student.valid? 
      @student.save 
      redirect_to student_path(@student)
    else 
      flash[:errors] = @student.errors.full_messages
      redirect_to "/students/#{@student.id}/edit"
    end 
  end 


  private 
  def student_params
    params.require(:student).permit(:name, :major, :age, :instructor_id)
  end 

  def get_student 
    @student = Student.find(params[:id])
  end 

  def get_instructors
    @instructors = Instructor.all 
  end 
  
end
