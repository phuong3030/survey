class CreateProfiles < ActiveRecord::Migration[6.0]
  def change
    create_table :profiles do |t|
      t.references :respondent, null: false, foreign_key: true, index: true
      t.string :gender
      t.string :department

      t.timestamps
    end
  end
end
