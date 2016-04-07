class User < ActiveRecord::Base
  # has_many: answers
  # has_many: questions

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, uniqueness: true

end
