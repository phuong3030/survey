class CreateJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :surveys, :questions do |t|
      t.index [:survey_id, :question_id], name: 'index_surveys_questions', unique: true
      t.string :body
      t.string :type
    end
  end
end
