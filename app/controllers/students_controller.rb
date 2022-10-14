class StudentsController < ApplicationController
  def index 
    student = Student.all 
    render json: student, status: :ok 
  end 

  def show 
    student = Student.find(params[:id])
    render json: student, status: :ok
  end 

  def update 
    student = Student.find(params[:id]) 
    student.update(student_params)
    render json: student, status: :ok
  end 

  def create 
    if student_params.include?(:instructor_id)
      student = Student.create(student_params)
      render json: student, status: :created
    else 
      render json: {errors: 'Must include instructor ID'}, status: :bad_request 
    end 
  end 

  def destroy 
    student = Student.find(params[:id]) 
    student.destroy
    render json: {}, status: :ok
  end 

  private 

  def student_params 
    params.permit(:name, :age, :major, :instructor_id)
  end 
end
