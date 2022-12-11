class CreatePolls < ActiveRecord::Migration[7.0]
  def change
    create_table :polls, id: :uuid do |t|
      t.string :question

      t.timestamps
    end
  end
end
