class CreateJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_table :questions_surveys do |t|
      t.index [:survey_id, :question_id], name: 'index_surveys_questions', unique: true
      t.integer :survey_id
      t.integer :question_id
      t.string :body
      t.string :type
    end
  end
end
