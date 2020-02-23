FactoryBot.define do
  factory :profile do
    gender { Faker::Demographic.sex }
    department { Faker::Commerce.department }
  end

  factory :respondent do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }

    association :profile, strategy: :build, factory: :profile
  end

  factory :survey do
    association :respondent, strategy: :build, factory: :respondent
  end

  factory :question, class: "Question::Base" do
    prompt { Faker::Quote.famous_last_words }
  end

  factory :scored_question, parent: :question, class: "Question::Scored"
  factory :open_ended_question, parent: :question, class: "Question::OpenEnded"

  factory :answer, class: "Answer::Base" do
    survey
  end

  factory :scored_answer, parent: :answer, class: "Answer::Scored" do
    numeric_body { Faker::Number.within(range: 1..5) }
    association :question, strategy: :create, factory: :scored_question
  end

  factory :open_ended_answer, parent: :answer, class: "Answer::OpenEnded" do
    body { Faker::Lorem.sentence(word_count: 3) }
    association :question, strategy: :create, factory: :open_ended_question
  end
end
