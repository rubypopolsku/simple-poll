class PollAnswer < ApplicationRecord
  belongs_to :poll
  has_many :votes
end
