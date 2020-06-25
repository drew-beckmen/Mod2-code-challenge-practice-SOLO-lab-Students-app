class InstructorsController < ApplicationController

  before_action :get_instructor, only: [:show]

  def index
    @instructors = Instructor.all
  end

  # Important to think about where your logic goes
  # The calculations should go in the model 
  # not the controller. And definitely not 
  # the view
  def show 
    @average_age = @instructor.average_age
    @students = @instructor.students.sort_by {|student| student.name}
  end 

  private 
  def get_instructor 
    @instructor = Instructor.find(params[:id])
  end 
end
