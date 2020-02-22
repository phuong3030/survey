class CreateQuestions < ActiveRecord::Migration[6.0]
  def change
    create_table :questions do |t|
      t.string :prompt
      t.string :type
      t.boolean :optional, default: true

      t.timestamps
    end
  end
end
