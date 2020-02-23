r = Respondent.create first_name: 'phuong', last_name: 'tran'
r.profile = Profile.create gender: 'Male', department: 'Sales'
r.surveys << Survey.new
r.surveys.first.questions << Question::Scored.new(prompt: 'question 1', optional: false)
r.surveys.first.questions << Question::OpenEnded.new(prompt: 'question 2', optional: true)
