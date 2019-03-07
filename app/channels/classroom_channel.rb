class ClassroomChannel < ApplicationCable::Channel
  def subscribed
    # classroom = Classroom.find_by(id: params[:id])
    stream_from 'new_classroom'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
