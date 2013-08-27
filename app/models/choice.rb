class Choice < ActiveRecord::Base
  belongs_to :question
  has_many :responses

  def vote_count
    responses.size
  end

  def votes_percentage
    return 0 if vote_count == 0
    (vote_count / question.total_votes.to_f*100).floor
  end

end
