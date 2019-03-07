class UserListenerChannel < ApplicationCable::Channel

  def subscribed
    user = User.find(params[:user_id])
    byebug
    stream_for user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
