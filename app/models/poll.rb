class Poll < ApplicationRecord
  has_many :poll_answers
  has_many :votes
end
