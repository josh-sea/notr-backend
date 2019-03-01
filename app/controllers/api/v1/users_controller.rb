class Api::V1::UsersController < ApplicationController
# before_action: :only, [:create, :show, :destroy]


  def index
    @users = User.all
    render json: @users, status: :ok
  end

  # def show
  #   byebug
  #   @user = User.find(params[:id])
  #   @class_name = @user.classrooms.uniq
  #   render json: {className: @class_name}
  # end

  def listener
    @user = User.find(params[:user_id])
    classrooms = @user.classrooms
    ActionCable.server.broadcast 'user_listener', classrooms
    render json: @user, status: :ok
  end


  def login
    @user = User.find_by(username: params[:username])
    @notes = @user.notes
    @classrooms = @user.classrooms.uniq
    if @user
      render json: {success: true, user: @user, notes: @notes, classrooms: @classrooms}, status: :ok
    else
      render json: {success: false, user: @user, notes: @notes, classrooms: @classrooms}, status: :unauthorized
    end
  end

  def register
    @user = User.create(user_params)
    @notes = @user.notes
    @classrooms = @user.classrooms.uniq
    if @user
      render json: {success: true, user: @user, notes: @notes, classrooms: @classrooms}, status: :ok
    else
      render json: {success: false, user: @user, notes: @notes, classrooms: @classrooms}, status: :unauthorized
    end
  end


  def create
    @user = User.create(user_params)
    if @user.valid?
      render json: {success: true, user: @user, notes: @user.notes}, status: :ok
    else
      render json: {success: false, user: @user, errors: @user.errors.messages}, status: :bad_request
    end
  end

  def show
    render json: @user, status: :ok
  end










#################################################################################################
  private
#################################################################################################

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :user_id)
  end

#################################################################################################

end #end of users controller
