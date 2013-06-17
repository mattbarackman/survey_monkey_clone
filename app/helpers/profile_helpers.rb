helpers do
	def survey_result_objects
  	@resp_count = @survey.responses.length
		@results = []
		@survey.questions.each do |i|
			i.choices.each do |j|
				choice_results = []
				choice_results << { c_name: j.text,
						 								c_id: j.id,
						 								c_resp_count: j.responses.length
									 				}
			@results << { q_resp_count: i.responses.length,
									  q_name: i.text,
									  resp_results: choice_results
										# q_percent: ((i.responses.length)/(j.responses.length)*100.0)
									}
	  	end
	  end
	end
end
