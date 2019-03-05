class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :notes, :classrooms

  def classrooms
    @users = self.object.classrooms.map{|classroom|classroom.users}.flatten.uniq
    @users_classrooms = @users.map{|user|user.classrooms}.flatten.uniq
  end

  def notes
    self.object.classrooms.map{|classroom| classroom.notes}.flatten.uniq
  end

end
