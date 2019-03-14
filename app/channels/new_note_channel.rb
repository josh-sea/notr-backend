class NewNoteChannel < ApplicationCable::Channel


  def subscribed
    # classroom = Classroom.find_by(id: params[:classroom_id])
    # stream_for classroom
    stream_from 'new_note'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    unsubscribe()
  end
end
