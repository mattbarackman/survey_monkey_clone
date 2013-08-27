class Question < ActiveRecord::Base
  belongs_to :survey
  has_many :choices
  has_many :responses

  def total_votes
    choices.map {|choice| choice.vote_count}.reduce(:+)
  end

end
