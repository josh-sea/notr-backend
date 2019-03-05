class Api::V1::UsersController < ApplicationController
before_action :find_user, only: [:create, :show, :destroy]


  def index
    @users = User.all
    @classrooms = Classroom.all
    @notes = Note.all
    render json: {users: @users, classrooms: @classrooms, notes: @notes}, status: :ok
  end

  def show
    @notes = @user.notes
    @classrooms = @user.classrooms.uniq
    @users = @user.classrooms.map{|classroom|classroom.users}.flatten.uniq
    render json: {success: true, user: UserSerializer.new(@user), classrooms: @classrooms, notes: @notes, users: @users}, status: :ok
  end

  # def listener
  #   @user = User.find(params[:user_id])
  #   classrooms = @user.classrooms
  #   ActionCable.server.broadcast 'user_listener', classrooms
  #   render json: @user, status: :ok
  # end

  def login
    @user = User.find_by(username: params[:username])
    @notes = @user.notes
    @classrooms = @user.classrooms.uniq
    @users = @user.classrooms.map{|classroom|classroom.users}.flatten.uniq
    if @user && @user.authenticate(params[:password])
      token = encode_token(@user.id)
      render json: {success: true, user: UserSerializer.new(@user), notes: @notes, classrooms: @classrooms, users: @users, token: token}, status: :ok
    else
      render json: {success: false, user: UserSerializer.new(@user), notes: @notes}, status: :unauthorized
    end
  end

  def register
    @user = User.create(username: params[:username], password: params[:password])
    @notes = @user.notes
    @classrooms = @user.classrooms.uniq
    @users = @user.classrooms.map{|classroom|classroom.users}.flatten.uniq
    if @user.valid?
      token = encode_token(@user.id)
      render json: {success: true, user: UserSerializer.new(@user), notes: @notes, classrooms: @classrooms, users: @users, token: token}, status: :ok
    else
      render json: {success: false, errors: @user.errors.full_messages}, status: :unauthorized
    end
  end

  def curr_user
    # token = token()
    user_id = decode_token(token())
    @user = User.find_by(id: user_id)
    if @user
      @notes = @user.notes
      @classrooms = @user.classrooms.uniq
      @users = @user.classrooms.map{|classroom|classroom.users}.flatten.uniq
        render json: {success: true, user: UserSerializer.new(@user), notes: @notes, classrooms: @classrooms, users: @users, token: token}, status: :ok
    else
      render json: {success: false, user: UserSerializer.new(@user), notes: @notes, classrooms: @classrooms}, status: :unauthorized
    end
  end

  # def create
  #   @user = User.create(user_params)
  #   if @user.valid?
  #     render json: {success: true, user: UserSerializer.new(@user), notes: @user.notes}, status: :ok
  #   else
  #     render json: {success: false, user: UserSerializer.new(@user), errors: @user.errors.messages}, status: :bad_request
  #   end
  # end










#################################################################################################
  private
#################################################################################################

  def find_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :password, :user_id)
  end

#################################################################################################

end #end of users controller
