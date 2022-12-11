class AddUserToPollsAndVotes < ActiveRecord::Migration[7.0]
  def change
    add_reference :polls, :user, index: true
    add_reference :votes, :user, index: true
  end
end
