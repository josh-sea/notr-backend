class Api::V1::ClassroomsController < ApplicationController


  def index
    @classrooms = Classroom.all
    render json: @classrooms, status: :ok
  end

  def create
    @classroom = Classroom.find_or_create_by(name: params[:name].downcase)
    @user = @classroom.users.find{|user|user.id === params[:user_id]}
    if @user
      # ActionCable.server.broadcast('new_classroom', {classroom: @classroom, note: {}, user: @user})
      render json: {classroom: @classroom, note: {}, user: @user}, status: :ok
    elsif !@classroom.users.find{|user|user.id === params[:user_id]}
      @note = Note.create(title: 'Untitled', content: '', user_id: params[:user_id], classroom_id: @classroom.id)
      # ActionCable.server.broadcast('new_classroom', {classroom: @classroom, note: @note, user: @user}))
      render json: {classroom: @classroom, note: @note, user: @user}, status: :ok
    end
  end

  def show
    @classroom = Classroom.find_by(id: params[:id])
    @notes = @classroom.notes
    @users = @classroom.users
    render json: {classroom: @classroom, notes: @notes, users: @users}, status: :ok
  end

  private
  def classroom_params
    params.require(:classroom).permit(:name)
  end
end ### end of the classroom controller
