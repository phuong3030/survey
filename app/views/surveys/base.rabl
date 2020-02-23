#attributes :id, if: lambda { |r| r.valid? }
attributes respondent_id: :respondentIdentifier

child :questions, root: 'questions', object_root: false do
  extends "questions/show"
end

child :answers, root: 'responses', object_root: false do
  extends "answers/show"
end

node :errors, if: lambda { |r| r.errors.present? } do |m|
  m.errors.full_messages
end
