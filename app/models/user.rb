class User < ApplicationRecord
  validates :username, uniqueness: {case_sensitive: false, message: "An account with that username already exists"}, length: {minimum: 3, message: "Your username must be 3 characters or greater"}
  has_many :notes
  has_many :classrooms, through: :notes
end
