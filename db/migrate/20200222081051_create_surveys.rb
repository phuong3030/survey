class CreateSurveys < ActiveRecord::Migration[6.0]
  def change
    create_table :surveys do |t|
      t.references :respondent, index: true, foreign_key: true, null: false

      t.timestamps
    end
  end
end
