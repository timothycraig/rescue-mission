class Question < ActiveRecord::Base
  has_many :answers

  validates :title, presence: true, length: { minimum: 40 }
  validates :question_body, presence: true, length: { minimum: 150 }
end
