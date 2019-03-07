class Api::V1::ClassroomsController < ApplicationController


  def index
    @classrooms = Classroom.all
    render json: @classrooms, status: :ok
  end

  def create
    @classroom = Classroom.find_or_create_by(name: params[:name].downcase)
    if @classroom.users.find{|user|user.id === params[:user_id]}
      # ActionCable.server.broadcast('new_classroom', {classroom: @classroom, note: {}})
      render json: {classroom: @classroom, note: {}}, status: :ok
    elsif !@classroom.users.find{|user|user.id === params[:user_id]}
      @note = Note.create(title: 'Untitled', content: '', user_id: params[:user_id], classroom_id: @classroom.id)
      # ActionCable.server.broadcast('new_classroom', {classroom: @classroom, note: @note})
      render json: {classroom: @classroom, note: @note}, status: :ok
    end
  end

  private
  def classroom_params
    params.require(:classroom).permit(:name)
  end
end ### end of the classroom controller
