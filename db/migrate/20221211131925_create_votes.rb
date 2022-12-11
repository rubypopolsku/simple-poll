class CreateVotes < ActiveRecord::Migration[7.0]
  def change
    create_table :votes, id: :uuid  do |t|
      t.references :poll_answer, null: false, foreign_key: true, type: :uuid
      t.references :poll, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
