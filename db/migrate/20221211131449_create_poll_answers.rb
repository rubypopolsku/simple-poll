class CreatePollAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :poll_answers, id: :uuid  do |t|
      t.string :answer
      t.references :poll, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
