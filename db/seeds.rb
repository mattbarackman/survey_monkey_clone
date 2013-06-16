NUM = 5

def randnum
  rand(NUM-1)+1
end 


NUM.times do 
  User.create(email: Faker::Internet.email, password_digest: Faker::Lorem.words(1))
end

NUM.times do 
  Survey.create(name: Faker::Lorem.sentence(1), user: User.find(randnum))
end




ALL_SURVEYS = Survey.all

ALL_SURVEYS.each do |survey|

	(NUM).times do
		Question.create(text: Faker::Lorem.sentence(1), survey: Survey.find(survey.id))
	end
end

ALL_SURVEYS.each do |survey|
	survey.questions.each do |question|
		(NUM).times do
  			Choice.create(text: Faker::Lorem.sentence(1), question: Question.find(question.id))
		end
	end
end

(NUM*10).times do
	Response.create(user: User.find(randnum), choice: Choice.find(randnum), question: Question.find(randnum))
end

(NUM*10).times do
	Respondent.create(user: User.find(randnum), survey: Survey.find(randnum))
end