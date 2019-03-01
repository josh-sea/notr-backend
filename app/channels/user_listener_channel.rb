class UserListenerChannel < ApplicationCable::Channel

  def subscribed
    stream_from 'user_listener'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
