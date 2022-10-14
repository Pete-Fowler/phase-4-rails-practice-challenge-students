class InstructorsController < ApplicationController
  def index 
    inst = Instructor.all 
    render json: inst, status: :ok 
  end 

  def show 
    inst = Instructor.find(params[:id])
    render json: inst, status: :ok
  end 

  def update 
    inst = Instructor.find(params[:id]) 
    inst.update(inst_params)
    render json: inst, status: :ok
  end 

  def create 
    inst = Instructor.create(inst_params)
    render json: inst, status: :created
  end 

  def destroy 
    inst = Instructor.find(params[:id]) 
    inst.destroy
    render json: {}, status: :ok
  end 

  private 

  def inst_params 
    params.permit(:name)
  end 
end
