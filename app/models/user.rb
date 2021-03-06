class User < ActiveRecord::Base
  has_secure_password

  has_many :responses
  has_many :choices, :through => :responses
  has_many :respondents
  has_many :surveys, :through => :respondents #user.surveys => all the surverys they've taken.

  validate :email, :password, :presence => true
  validate :email, :uniqueness => true

  def surveys_authored
   Survey.where(user_id: self.id)   
  end

end
