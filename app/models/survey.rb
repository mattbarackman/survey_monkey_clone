class Survey < ActiveRecord::Base
  belongs_to :user
  has_many :questions
  has_many :responses, through: :questions
end
