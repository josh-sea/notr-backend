class NoteSerializer < ActiveModel::Serializer
  attributes :id, :title, :content, :user_id, :classroom_id, :updated_at

  def updated_at
    self.object.updated_at.to_time.to_i
  end

end
