class CreatePollAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :poll_answers do |t|
      t.string :answer
      t.references :poll, null: false, foreign_key: true

      t.timestamps
    end
  end
end
